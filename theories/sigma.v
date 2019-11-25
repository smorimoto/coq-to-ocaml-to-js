(*
Copyright 2019 BSKY

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*)

Require Extraction.

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

Extraction "ocaml/sigma.ml" sigma.