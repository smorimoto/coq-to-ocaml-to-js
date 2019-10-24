#!/usr/bin/env bash

coq() {
  echo "∗ Extracting to OCaml..."
  mkdir -p ocaml
  cd ocaml
  coqc ../coq/sigma.v
}

bucklescript() {
  echo "∗ Compiling OCaml to JavaScript..."
  yarn build &>/dev/null
}

build() {
  coq
  bucklescript
  echo
  echo "Done!"
}

build
