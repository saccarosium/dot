## Sintassi

Il linguaggio è composto principalmente da liste che quando vengono
evaluate cercano dentro di loro simboli che puntano a funzioni.

```lisp 
    ;; Primitives are usally self-evaluating
    42
    
    "Hello!"
    
    ;; No self evaluating!
    buffer-file-name
    
    ;; Evaluating a function!
    (* 300 11)
    
    ;; Questo non funziona perchè dentro la lista non
    ;; si trova nessun simbolo che punta ad una funzione
    ( * * 300 100)
```