---
layout: post
title:  "States Monad for non-Functional Guy"
date:   2019-09-23 00:56:11 -0400
categories: Programming
---

# State Monad motivation for non-functional guy

A Monad is a concept from category theory. Basically a mathematical set with certain axiom(structure) imposed on that.

But in programming language, for example C++, only template classes can be called monad. In other words, we can only describe the definition/concept of monad in Java's Interface; but C++ doesn't have interface! So I will just say:
```cpp
  F<A> pure(A a); 
    // pure : A -> F<A>

  template<B>
  F<B> flatMap(F<A> fa, function<F<B>(A)> f); 
    // flatMap : F<A> x (A -> F<B>) -> F<B>

```
any template class (`F` here) with above two methods is a monad as long as we have the following rules (called Monad Laws):

*   flatMap(pure(a), anyFunction) === anyFunction(a)
*   flatMap(x, pure) === x
*   flatMap(m, [lambda x: flatMap(k(x), h)]) === flatMap(flatMap(m, k), h) 

Note that you don't need to worry about the meaning of the three rules. (to write program unless you are going to design monad yourself)

Note that a template class is monad on only one type parameter. (i.e. if a class has two type parameter, it can only choose to be a monad over one type parameter. You will see the follow StateMonad as example).

You will say "what is this horrendous stuff!" Let me get to the concept of State Monad

### State Monad
Consider if we want to only have pure functions in C++, never write any assignment; but we want to have state, what horrendous thing will we do?

Actually very simple, every function that need a state will attach a state in the input and output type. 

For example, you have
```cpp
int IHaveBeenCalled(void* notMatterPointer) {
  static int j;
  return j++;
}
```
This one is not pure, because everytime it is called, the return is different. We have a static variable inside that stores the number of invocation happens.

Haskeller will tell you "rewrite it purely is simple! just pass in the state and get the state back for next time to use!"

```cpp
// state currently just include the data of 'j', so we will alias State=int

tuple<int, State> IHaveBeenCalled(void* notMatterPointer, State oldstate) {
  return tuple<int, State>(oldstate, oldstate+1)
}

(time0, fstState) = IHaveBeenCalled(null, initialState)
(time1, sndState) = IHaveBeenCalled(null, fstState)
...
(time10, tenthState) = IHaveBeenCalled(null, ninethState)
```

You will mock back "Wow excellent! You have pure functions! But everytime you call a function, you will have to pass in states! That is messy, un-maintainable, and extra-ugly."

Haskeller cries but [Philip Wadler](https://en.wikipedia.org/wiki/Philip_Wadler) argues back "although we are messy here, but Haskeller can introduce DSL to make messy things cleaner!"

And then he introduces State Monad:

```cpp
template <State, C> // Two Type Parameter, thus we say StateMonad<X,C> is a monad on C; ONLY on ONE PARAMETER!
class StateMonad {
 function<tuple<State, C>(State)> functionPointerAsTheData; // we store a lambda inside this class of objects, mapping the initialState to a tuple of result and final state
};

StateMonad<State, C> pure(C c) { return StateMonad([lambda s: tuple<>(s, c)]); }
 
StateMonad<State, B> flatMap(StateMonad<State, A> preState, function<StateMonad<State, B>(A)> map) {
  return [lambda s: {
           let (s0, a) = preState(s)
           in map(a)(s0)  
                    } ];
           }
}

```

If you are interested, you can verify the above three Monad Law. StateMonad is supposed to follow the rules.

But what does it mean? It means the state monad is actually a function, an operational sequence with given input as initial state, we would have the final state and the result we want. So instead of using lambda to describe any computation requires state, we use state monad to describe the computation that needs state.

`pure` will always return a computation that the result is fixed as indicated; `flatMap` is a concatenation of two different computation with state, also passing the result downwards.

After abstraction (as StateMonad) is done, let us see how good using the StateMonad is to write program -- 

```cpp
// setter and getter of the state
StateMonad<State, State> get = [lambda s: return (s,s)]
StateMonad<State, Bool> set (State newstate) {
  return [lambda s: (newState, True)] // The Bool Here is never cared -- it doesn't have meaning
}
// State is still an alias of Int, we replay the above example of 'IHaveBeenCalled'
StateMonad<State, int> IHaveBeenCalled(void* noMatterPointer) { 
  return flatMap(get, [lambda x: 
                         return flatMap(set(x + 1), [lambda y: return pure(x)]                     
                      ]); // y is never cared.
// what does this program mean??
}
```

You will find something very weird -- get is a fixed object(function), no input is ever required; we never need to specify the "State" we are setting. Because the input "state" has already been hidden in the type "StateMonad".

I will suggest newcomer that are confused about the body of `IHaveBeenCalled` here to consider flatMap as a binary operation `>>= ` of type "StateMonad<State,A> x (A -> StateMonad<State, B>) -> StateMonad<State, B>"; 

we also use notation `\x -> body` to indicate `lambda x:body`

then the above function body can be rewritten as 
```haskell
get >>= (\x -> set(x + 1) >>= \y -> pure(x))
```
Still too vague about what this means? Haskeller says that Do-Notation can help a lot! By changing a bit of the parser of Haskell --

```haskell
do x <- get  -- first we get the current state, and bind to x
   set(x+1)  -- we set state to be x+1
   pure(x)   -- we return the number of x as the result of computation (that together with state to return)
``` 
The above syntax shows you the imperative code of `IHaveBeenCalled`, while can be easily parse into the `>>=` concatenating style -- any `do x<- action1; y <- action2 ...` will be transformed into `action1 >>= \x -> (action2 >>= \y -> ...)`

Another insight is that, when you written in the do-notation, you can feel that the state is at the background of the computation code you wrote. You can call `get` to make it foreground, you can call `set` to change the background. But you can see there is only one background... so only one state is at the background -- but we can compose multiple data into one data and put into the background!

We really know the above snippet in haskell's do-notation-syntax-code is what we want for the semantic for `IHaveBeenCalled`, but is it functionally the same? (Yes! Please verify them by testing with some input)

And at the end the computation returns a `StateMonad`, how can we use it?

Recall that "StateMonad" is ultimately a function requires an initial state to start. Using Haskell's do notation

```haskell
computationWithState = do times0 <- IHaveBeenCalled(null)
                          times1 <- IHaveBeenCalled(null)
                         ...
                 times10 <- IHaveBeenCalled(null)
                 pure(times10)

result, finalState = runStateMonad(computationWithState,0)
```

In C++, only the construction of the computational sequence needed to be replayed, which will be omitted because we know how to expand do-notations into `>>=` which is basically `flatMap`.

But one interesting fact is that, we know cpp supports OO, have you ever think of making flatMap OO styles? If we make the first input (the monad) as the object --

```cpp
StateMonad<State, int> IHaveBeenCalled(void* noMatterPointer) {
return get.flatMap(
  lambda x: set(x+1).flatmap( lambda y: pure(x))
);
```


## Epilogue
* Reader Monad is basically a StateMonad where you cannot set the back ground state (you can only `get`)

* Scala uses 'for-comprehension' as the substitute for the Do-Notation. The meaning is well-written in the paper "Staged Abstract Interpreter"

* There is a very strong blindspot here -- I first tell you the programming definition of monad comes from the mathematical definition; then I show you how stateful-computation can be modeled as a kind of monad. The question is -- the modeling is ultimately a kind of design pattern, but is this the only design pattern? Is this the easiest to understand? I seem to forcefully connect this design pattern with monad to justifies the usefulness of monad. Unless I can somehow show this way of modeling is the **[universal](https://en.wikipedia.org/wiki/Universal_property)** way to model. A bad counter-example is extensible effect because it seems to model side-effect/state using exception-handling-style (called algebraic effect). It is a bad counter example because one of the implementation of algebraic effect is free monad.

* State Monad is just a type of Monad, there are also List Monad, Set Monad and Maybe Monad. Among them, only State Monad has the ability to model stateful-computation, List Monad, Set Monad has the ability to model nondeterminism. Ultimately, only the above Monad Laws is the key characterization of Monad; if anyone ask you what is a monad, you can either throw back the three Monad Laws or just say ["monad is just a monoid in the category of endofunctors, what's the problem?"](https://stackoverflow.com/questions/3870088/a-monad-is-just-a-monoid-in-the-category-of-endofunctors-whats-the-problem).

 