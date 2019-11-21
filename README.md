# coq-to-ocaml-to-js

[![Main workflow](https://github.com/imbsky/coq-to-ocaml-to-js/workflows/Main%20workflow/badge.svg)](https://github.com/imbsky/coq-to-ocaml-to-js/actions)
[![GitHub package.json version](https://img.shields.io/github/package-json/v/imbsky/coq-to-ocaml-to-js?style=flat-square)](https://github.com/imbsky/coq-to-ocaml-to-js/blob/master/package.json)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![GitHub](https://img.shields.io/github/license/imbsky/coq-to-ocaml-to-js?color=brightgreen&style=flat-square)](https://github.com/imbsky/coq-to-ocaml-to-js/blob/master/LICENSE)

## Overview

This repository is nothing more than a proof of concept using Coq's Extraction,
BuckleScript, Rollup, Terser, and Closure Compiler to generate safe and fast
JavaScript.

### What is Coq

> Coq is a proof assistant. It means that it is designed to develop mathematical
> proofs, and especially to write formal specifications, programs and proofs
> that programs comply to their specifications. An interesting additional
> feature of Coq is that it can automatically extract executable programs from
> specifications, as either Objective Caml or Haskell source code. -
> [A short introduction to Coq](https://coq.inria.fr)

### What is BuckleScript

> BuckleScript isn't a new language. It simply takes OCaml, a fast, pragmatic
> and typed language, and makes it compile to clean, readable and performant
> JavaScript code. -
> [What is BuckleScript?](https://bucklescript.github.io/docs/en/what-why)

### Workflow and directory structure

```text
Coq Code
  |
  | (Use Coq Compiler)
  v
OCaml Code
  |
  | (Use BuckleScript)
  v
Optimized JavaScript Code
  |
  | (Use Rollup, Terser, Closure Compiler)
  v
More Optimized JavaScript Code
```

### Source code

```coq
Fixpoint f n :=
  match n with
  | O => nat
  | S n => nat -> (f n)
  end.

Definition sigma: forall n, f n.
  intro n; induction n; simpl.
    exact O.
  intro m.
  destruct n; simpl in *.
    exact m.
  intro o.
  apply IHn.
  exact (m+o).
Defined.
```

### Generated codes

`sigma.ml`

```ocaml
type __ = Obj.t

type nat = O | S of nat

let rec add n m = match n with O -> m | S p -> S (add p m)

type f = __

let rec sigma = function
  | O -> Obj.magic O
  | S n0 ->
      Obj.magic (fun m ->
          match n0 with
          | O -> m
          | S _ -> fun o -> Obj.magic sigma n0 (add (Obj.magic m) o))
```

`sigma.mli`

```ocaml
type __ = Obj.t

type nat = O | S of nat

val add : nat -> nat -> nat

type f = __

val sigma : nat -> f
```

`sigma.js`

```javascript
import * as Curry from "bs-platform/lib/es6/curry.js";

function add(n, m) {
  if (n) {
    return [add(n[0], m)];
  } else {
    return m;
  }
}

function sigma(param) {
  if (param) {
    var n0 = param[0];
    return function(m) {
      if (n0) {
        return function(o) {
          return Curry._1(sigma(n0), add(m, o));
        };
      } else {
        return m;
      }
    };
  } else {
    return 0;
  }
}

export { add, sigma };
```

## Build

See the file [BUILD.md](BUILD.md) for build instructions.

## License

&copy; Contributors Licensed under the
[Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0).
