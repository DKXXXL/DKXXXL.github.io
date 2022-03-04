---
layout: post
title:  "Notes on Developing Coq Plugin"
date:   2022-03-03 00:56:11 -0400
categories: Coq
---

This note is a summary of the exploration of developing Coq Plugin. It will collect a lot of (ir)relevant information that might help understanding implementing a Coq Plugin.

# Official Documents

https://github.com/coq/coq/tree/master/dev/doc

https://github.com/coq/coq/tree/master/doc/plugin_tutorial 

# Toolchain 

### Coq itself
I setup Coq [using opam](https://github.com/coq/coq/blob/master/INSTALL.md), and then install the coq-core from opam; and then I git-clone the coq source code in another directory. This can avoid all the possible building issues, but with the source code and working Coq on my hand.

I use VSCode, and together with OCaml-lsp-server.  Note that, to turn on code analysis in coq repository, you need to first run `dune check` inside coq repository, then the OCaml-lsp-server will starts to work. 

### Coq Plugin

There are [four tutorials](https://github.com/coq/coq/tree/master/doc/plugin_tutorial) that include the basic examples of constructing Coq plugins. However, they all use makefile, and it will make LSP non-functional. 




To build plugins using dune:
https://coq.discourse.group/t/a-guide-to-building-your-coq-libraries-and-plugins-with-dune/20

Now you should have a functional VSCode helping you.

***

For these four tutorials:

* Tut0 provides a hello world example, in my opinion it is mainly used to test the building environment
* Tut1 has the most detailed comments. The main theme is about Coq and Coq plugin's interaction. For example, how to accept a piece of Coq AST code and inspect and manipulate it from Plugin/OCaml's side. 
* Tut2's main theme is about how to maintain customized data inside plugin, possibly persistently
* Tut3 includes the most important `construction_game.ml`, which is about constructing Coq's (possibly inductive) data from Plugin/OCaml's side 

*** 

#### Some fragments of thought
0. There are also [a full (maybe outdated) story](https://github.com/coq/coq/blob/master/dev/doc/parsing.md) of how the parsing command for plugin means. You might find it helpful.
1. In `construction_game`, `find_reference` is annotated as deprecated and suggesting to use `Coqlib.lib_ref`. It is easier to use, for example, if you want to refer to the addition function for `nat`, then check Coq doc/source code, and looking for this sentence `Register add as num.nat.add.`. Then you can directly get the reference via `Coqlib.lib_ref "num.nat.add"`. It is written clear in `coqlib.mli`
2. In Coq, some natural number literals and string literals will not be interpreted until certain syntax scope is open. This means natural number and string literals are not intrinsic data of Coq's core language. But it is still possible to reflect a OCaml string into Coq's string. Except for using the above idea that recursively calling constructor of string, 
   1. a quick and dirty way is to use `CAst.make @@ CPrim ( Constrexpr.String (Names.Id.to_string f))` for ` f: string`. to get a `Constrexpr.constr_expr`, which by `interp_constr_evars`, we can get a typed Coq string. 
   2. Check `Notation.interp_prim_token_gen` you will see how the string literals are handled -- 
   3. which also shows the downside -- we have to instantiate the `local_scope`. An easy way out is to, in Coq file, first open the string scope, then issue the command that will interpret the `CPrim of string`.
3. If you wonder what is `econstr`, check [here](https://github.com/coq/coq/blob/master/dev/doc/econstr.md). Basically it is a typed term with some unsolved meta-variable. So the `Evd.evar_map` store the meta-variable. And `Global.env()` is about global definitions
  

### How far can I extend Parser?

### Module Component
1. The projection on module fields like `a.b.c` will be interpreted as `Names.ModPath.t`. 
2. `MPdot` is the constructor that represent `.` projection; `MPbound of uniq_ident (* reference to a module parameter in a functor *)` (locate at `names.mli`) is also related
  <!-- 
  1. How does `.` become `MPdot`?
  2. How to make sure ModPath can access to the thing I want? (Like a database, or library something)
  3. Can I extend grammar for new core language? Not only new command, but also new constr_expr/EConstr.expr ?
  4. 3.5 What is wit_ all about?
  5. How does type checking interplay with module parameter?
   -->


***
### Fragments of thought
0. Coq program starts inside the folder `toplevel`, also `stm.mli` will call `Vernacinterp.interp` which handles the interpretation of vernacular commands in Coq. `stm` stands for *state-transaction-machine interface*
1. `pcoq.mli` seems includes the key documentation of parser extension
2. `GRAMMAR EXTEND Gram` is really just context free grammar (complete style), unlike in the plugin
   1. For example, the  `GRAMMAR EXTEND Gram\nGlobal: [sth]` [sth]() here are all the non terminal I assume
   2. Unlike in the plugin, `VERNAC COMMAND EXTEND ...` this style is very partial, and doesn't create new non-terminal symbol *explicitly*
   3. Look at How [Mtac extends grammar](https://github.com/Mtac2/Mtac2/blob/0a52632b8203860c95f18c5c808712c6a9da0859/src/metaCoqInit.mlg#L104), it is definitely possible to extend using `GRAMMAR EXTEND`
   4. Look at How Coq-Equations extends a existent [non-terminal](https://github.com/mattam82/Coq-Equations/blob/a65e6511038bfc33ed87b8526b5a3e4e3041b1a8/src/g_equations.mlg#L288)
      1. Of course we know we cannot extend `constr_expr/EConstr.expr` because it is a OCaml data structure 
      2. but we don't know after this parsing, for this new equation for this non-terminal, where will the data constructed by extended law go to? How to make control flow 
3. How does `.` become `MPdot`?
   1. The possible answer is on `g_constr.mlg:189`, we have a rule
      1. `| id = ident; f = Prim.fields; i = univ_annot -> { let (l,id') = f in CAst.make loc @@ CRef (make_qualid loc (DirPath.make (l@[id])) id', i)` 
         1. we should test this idea by putting an `reference/qualid` in plugin
      2. Once CRef is created, the `Constrintern.internalize` will apply `intern_applied_reference` to analyze `CRef`, which again uses `intern_qualid`
         1. which is called by `intern_gen`, which is called by `interp_constr_evars` to type check
      3. Note that, `EConstr.t` ⊃ `GlobRef.t` ⊃ `KerName` ⊃ `ModPath.t`
4. Where does `ModPath` refer to?
5. When modifying the environment
6. Manipulating context related to Module
   1. `Environ.add_modtype` might be able to do modification
      1. then what is `the_modtypetab` used for? why there is this side effect stuff
      2. 