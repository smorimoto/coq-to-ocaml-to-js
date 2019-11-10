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

## Build

See the file [BUILD.md](BUILD.md) for build instructions.
