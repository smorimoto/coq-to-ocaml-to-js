# Coq to OCaml to JS

What I've done in this repository is generate safe and fast JavaScript using
Coq's Extraction and BuckleScript, Rollup, Closure Compiler, and Terser. and I'm
not used to Coq at all, so don't hesitate to send PR if you can write better
example code!

## Prerequirements

- Make sure you have the required dependencies installed:
  - `OCaml`: 4.08.1
  - `Coq`: 8.10.0
  - `Opam`: 2.0.5
  - `Node.js`: 12.13.0
  - `Yarn`: 1.19.1

## Overview

```
Coq Code
  |
  | (Use Coq Compiler)
  v
OCaml Code
  |
  | (Use BuckleScript)
  v
Optimized Javascript Code
  |
  | (Use Rollup, Closure Compiler, Terser)
  v
More Optimized JavaScript Code
```

```
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
