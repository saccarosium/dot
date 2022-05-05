# Regex

* `.`: tutti i caratteri (es. `find -E . -maxdepth 1` mi darà tutti
  file nella corrente cartella di lavoro;
* `*`: anche questo significa tutti i caratteri ma se combinato
  davanti ad una parola cercherà tutte le istanze di quella lettera
  (es `find -E c* -maxdepth 1` questo mi ridarà tutti i file che
  iniziano con la c, fregandosene di quello che c'è dopo)