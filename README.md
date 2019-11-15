# coq-to-ocaml-to-js [![Main workflow](https://github.com/imbsky/coq-to-ocaml-to-js/workflows/Main%20workflow/badge.svg)](https://github.com/imbsky/coq-to-ocaml-to-js/actions)

## Overview

This repository is nothing more than a proof of concept using Coq's Extraction,
BuckleScript, Rollup, Terser, and Closure Compiler to generate safe and fast
JavaScript.

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

```text
.
├── coq
│   └── sigma.v
├── javascript
│   └── sigma.js
├── lib
│   └── es6
│       └── ocaml
│           └── sigma.js
└── ocaml
    ├── sigma.ml
    └── sigma.mli
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
