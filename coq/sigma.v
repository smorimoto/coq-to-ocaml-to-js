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

Extraction "sigma.ml" sigma.
