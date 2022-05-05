## Equalities

* `eq`: compara due parametri per vedere se sono lo stesso oggetto
* `eql`: compara due parametri per vedere se sono lo stesso oggetto e
  numero
* `equal`: compara due parametri per vedere se il valore è uguale

```lisp
    (eq 1 1)                ;; t
    (eq 3.1 3.1)            ;; nil
    (eq "thing" "thing")    ;; nil

    (eql 1 1)               ;; t
    (eql 3.1 3.1)           ;; t
    (eql "thing" "thing")   ;; nil

    (equal 1 1)             ;; t
    (equal 3.1 3.1)         ;; t
    (equal "thing" "thing") ;; t
```