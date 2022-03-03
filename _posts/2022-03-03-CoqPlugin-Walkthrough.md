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
1. In `construction_game`, `find_reference` is annotated as deprecated and suggesting to use `Coqlib.lib_ref`. It is easier to use, for example, if you want to refer to the addition function for `nat`, then check Coq doc/source code, and looking for this sentence `Register add as num.nat.add.`. Then you can directly get the reference via `Coqlib.lib_ref "num.nat.add"`. It is written clear in `coqlib.mli`
2. In Coq, some natural number literals and string literals will not be interpreted until certain syntax scope is open. This means natural number and string literals are not intrinsic data of Coq's core language. But it is still possible to reflect a OCaml string into Coq's string. Except for using the above idea that recursively calling constructor of string, 
   1. a quick and dirty way is to use `CAst.make @@ CPrim ( Constrexpr.String (Names.Id.to_string f))` for ` f: string`. to get a `Constrexpr.constr_expr`, which by `interp_constr_evars`, we can get a typed Coq string. 
   2. Check `Notation.interp_prim_token_gen` you will see how the string literals are handled -- 
   3. which also shows the downside -- we have to instantiate the `local_scope`. An easy way out is to, in Coq file, first open the string scope, then issue the command that will interpret the `CPrim of string`.