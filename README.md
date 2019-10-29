# Coq to OCaml to JS

[![Main workflow](https://github.com/imbsky/coq-to-ocaml-to-js/workflows/Main%20workflow/badge.svg)](https://github.com/imbsky/coq-to-ocaml-to-js/actions)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](http://makeapullrequest.com)
[![License](https://img.shields.io/github/license/asdf-community/asdf-direnv?color=brightgreen)](https://github.com/asdf-community/asdf-direnv/blob/master/LICENSE)
[![Dependabot Status](https://api.dependabot.com/badges/status?host=github&repo=imbsky/coq-to-ocaml-to-js)](https://dependabot.com)

This repository is nothing more than a proof of concept using Coq's Extraction,
BuckleScript, Rollup, Lebab, Terser, and Closure Compiler to generate safe and
fast JavaScript. and I'm not used to Coq at all, so don't hesitate to send PR if
you can write better example code!

## Prerequirements

- Make sure you have the required dependencies installed:
  - `Node.js`: 13.0.1
  - `yarn`: 1.19.1
  - `esy`: 0.5.8

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
Optimized JavaScript Code
  |
  | (Use Rollup, Lebab, Terser, Closure Compiler)
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

## Guide

### Install dependencies

```bash
# Install opam packages with esy
esy

# Install node packages with yarn
yarn
```

### Build

```bash
# Cleanup
yarn clean

# Extracting to OCaml
cd ocaml
esy coqc ../coq/*.v
cd -

# Compiling OCaml to JavaScript
yarn build
```
