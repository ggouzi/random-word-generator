# Word Generator

## Examples
### Examples of generated words

| FR|DE|ES|SE|FI|BR
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| <ul><li>battambruniez</li><li>chilierai</li><li>barloges</li><li>bellerient</li><li>mouvaux</li><li>pronomptâtes</li><li>huient</li><li>aphotiez</li><li>tassançont</li><li>désiontassées</li></ul> | <ul><li>audrückenhält</li><li>übendischausseln</li><li>runzes</li><li>ender</li><li>zerenstest</li><li>sünd</li><li>geberfentglänkt</li><li>übereiffel</li><li>mäßiges</li><li>sücken</li></ul>| <ul><li>busemos</li><li>solizarán</li><li>sentrarás</li><li>subdillemos</li><li>desperíais</li><li>amiternados</li><li>regrais</li><li>aguzación</li><li>avadonificaticas</li><li>atoramos</li></ul>| <ul><li>avlegens</li><li>kommande</li><li>lägsspeingstningamingen</li><li>skapplagsberna</li><li>fringsk</li><li>vrelningats</li><li>ögkaken</li><li>rödes</li><li>möjlse</li><li>föreaver</li></ul> | <ul><li>samanssuorihenälkuminna</li><li>pinalyrkkonauka</li><li>alvetranautinenteittaju</li><li>valmäys</li><li>junto</li><li>rakkivataakkinetanti</li><li>junne</li><li>vitelliteikkaoityä</li><li>vistelos</li><li>kainvarion</li></ul>  | <ul><li>gietação</li><li>respípereniro</li><li>matonecopiro</li><li>baucança</li><li>baleirosanse</li><li>chóloccino</li><li>nusco</li><li>calinear</li><li>fescênimbe</li><li>giroaleono</li></ul>|


### Examples of generated names

| FR | IT
| ------------- | ------------- |
|<ul><li>sylvien</li><li>amile</li><li>céloé</li><li>landrine</li><li>arictore</li><li>lucine</li><li>dorianne</li><li>yanaïs</li><li>théode</li><li>lune</li></ul>| <ul><li>berista</li><li>rudisto</li><li>pietto</li><li>graziorgia</li><li>alidina</li><li>marodrina</li><li>calbenzo</li><li>sebio</li><li>nicarda</li><li>romilliano</li></ul>

## Principle
This generator is based on a 2-level markov chain system

The idea is to create a hash based on an input dictionary file.
Hash key: Triplet of characters
Hash value: Probablity that, in a word, the two first character are followed by the last

## Supported languages
- FR
- ES
- DE
- FI
- SE
- BR

## Based on https://sciencetonnante.wordpress.com/2015/10/16/la-machine-a-inventer-des-mots-video/

## Sources

http://www.lexique.org/listes/liste_mots.php
https://raw.githubusercontent.com/words/an-array-of-spanish-words/master/corpus.txt
https://raw.githubusercontent.com/hugovk/everyfinnishword/master/kaikkisanat.txt
https://github.com/martinlindhe/wordlist_swedish
https://raw.githubusercontent.com/titoBouzout/Dictionaries/master/Portuguese%20(Brazilian).dic
http://www.gwicks.net/dictionaries.htm
https://www.data.gouv.fr/fr/datasets/liste-de-prenoms/
