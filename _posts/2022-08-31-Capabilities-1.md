---
layout: post
title:  "Capability Machine and Capabilities"
date:   2022-08-31 00:56:11 -0400
categories: PL
---

Reference: Formal Reasoning about Capability Machines, thesis by Skorstengaard



# Menu of concepts
## capability machine


## Graph-based models of capabilities
## secure compilation
> A secure compilation is a compilation that preserves some security property. 

For example, full-abstraction is the notion this thesis focuses on, and achieved by secure compilation. 

### full-abstraction secure compilation

> A fully abstract compiler provably preserves (and reflects) the observational behaviour of a program in any possible context it may be executed in.




*** 
From this part, we focus on introducing the low-level security guarantee about memory safety using memory capabilities.

## CHERI processor



This part is about CHERI architecture alone: CHERI is designed to be compatible with capabibility-unaware program (i.e. the normal program using normal set of instructions). The key is to separate them from those capabilitiy-aware program and make sure  capabilitiy-aware program is still secure.




CHERI provides the real machine with the concept of local capabilties.  

> To prevent illegal use of stack references, the approach relies on local capabilities, a type of capabilities offered by CHERI to temporarily relinquish authority, namely for the duration of a function invocation whereafter the capability can be revoked.

> The idea with local capabilities is to have a capability that can only be stored in a limited amount
of places. Specifically, a local capability can only be stored via a capability
with a special Permit Store Local permission. By being conservative when
handing out Permit Store Local capabilities, the places local capabilities
can be stored is severely limited. Further on CHERI, local capabilities cannot be passed in when the CCall instruction is executed which means that
local capabilities are confined to the compartment they stem from. The stack
capabilities on CHERI are local, so they cannot be accidentally leaked in a
call. Non-local capabilities are called global, and they work the same way as
without local capabilities.


> In the above, we have described CHERI as though it is a processor. However, it is actually a protection model that describes how an existing architecture may be extended with capabilities.
## capability safety

## well-bracketed control flow
Well-bracket control flow is a very basic in high level language -- it requires function return to the correct point. 

For example, in the thesis, the example is
```C
int a() {
  int x = 0;
  b ();   // Calling point b1
  x = 1;  // Point x2
  b ();   // Calling point b2
  return x; // Point x3
}

void b() // defined unknown
```
In usual case, when b2 is done, the PC will go to point x3. However, a maliciously defined `void b` can try to hack the return point and go to point x2.

Well-bracketed control flow is just saying this kind of hack cannot happen, and it is provably bound to return to point x3, no matter what `void b` is. This security is achieved by capability machine. 

The non-triviality mainly come from the fact that we are working on a low-level machine/language. 
## local-state encapsulation
> We also expect that a function’s local variables are inaccessible outside the context of the function.

For example, once entering `void b`, `x` is totally unaccessible (not even readable). This challenge also similarly comes from the fact that we are working on a low-level machine, and need to use secure primitive to help us to enforce this.

## local capabilities

***

The collected two paper both achieved "well-bracketed control flow" and "local-state encapsulation" but using different capability mechanism. The first one uses local capabilities (closer to CHERI)

<!-- # Review of "Using Local Capabilities"


# Review of "Using Linear Capabilities" -->
***

# Graph-based Model of Capabilities vs. Logical Relation based