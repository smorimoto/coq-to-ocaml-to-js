# Build Instructions

You can build this yourself from the source and try it out.

## Building from source

### Prerequirements

Make sure you have the required dependencies installed:

#### Node.js

Before we can build this, we need to make sure that we have a current Node.js.
(We use asdf to manage our runtime versions. You can get asdf via Git or
Homebrew.)

#### Yarn, esy

Although if you're an expert in Node.js and/or the OCaml ecosystem, not strictly
required, we recommend it to get consistent installs across machines.

### Getting the source

You can clone the source from GitHub with

```bash
git clone https://github.com/imbsky/coq-to-ocaml-to-js.git
```

You can complete the setup of your development environment with

```bash
cd coq-to-ocaml-to-js
yarn
esy
```

You can extract Coq to OCaml, and compile OCaml to JavaScript with

```bash
make build
```
