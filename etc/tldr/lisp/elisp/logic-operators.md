## Logic

Vero o falso in Lisp è `nil` o `t`. `nil` e lista vuota ridanno sempre `nil` qualsiasi altro valore ridà `t`

Nel linguaggio ci sono i soliti operatori di comparazione come: `<`
`>` `<=` `>=`. Nel caso dell'operatore `=` puoi darli anche una lista
di oggetti e se anche uno di questi è diverso ritorna `nil`.

Una buona aggiunta a gli operatori è `min` e `max` che ti permette di capire qual'è il valore maggiore o minore.

### Operatori logici

* `not`: ridà il contrario dell'espressione (es. (= 0 0))
* `and`: ridà l'ultima *value*, se e solo se tutte le altre sono vere
* `or`: ridà la prima *value* vera che trova
* `xor`: ridà la prima *value* vera che trova