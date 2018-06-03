# Word Generator

## Purpose
Words and names generator
## Examples
### Examples of generated words

| FR |DE |SE |FI |ES | PT | IT
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
| <ul><li>battambruniez</li><li>chilierai</li><li>barloges</li><li>bellerient</li><li>mouvaux</li><li>pronomptâtes</li><li>huient</li><li>aphotiez</li><li>tassançont</li><li>désiontassées</li></ul> | <ul><li>audrückenhält</li><li>übendischausseln</li><li>runzes</li><li>ender</li><li>zerenstest</li><li>sünd</li><li>geberfentglänkt</li><li>übereiffel</li><li>mäßiges</li><li>sücken</li></ul> | <ul><li>avlegens</li><li>kommande</li><li>lägsspeingstningamingen</li><li>skapplagsberna</li><li>fringsk</li><li>vrelningats</li><li>ögkaken</li><li>rödes</li><li>möjlse</li><li>föreaver</li></ul> | <ul><li>samanssuorihenälkuminna</li><li>pinalyrkkonauka</li><li>alvetranautinenteittaju</li><li>valmäys</li><li>junto</li><li>rakkivataakkinetanti</li><li>junne</li><li>vitelliteikkaoityä</li><li>vistelos</li><li>kainvarion</li></ul>  | <ul><li>busemos</li><li>solizarán</li><li>sentrarás</li><li>subdillemos</li><li>desperíais</li><li>amiternados</li><li>regrais</li><li>aguzación</li><li>avadonificaticas</li><li>atoramos</li></ul> | <ul><li>gietação</li><li>respípereniro</li><li>matonecopiro</li><li>baucança</li><li>baleirosanse</li><li>chóloccino</li><li>nusco</li><li>calinear</li><li>fescênimbe</li><li>giroaleono</li></ul>| <ul><li>cono</li><li>brasca</li><li>pedrivi</li><li>scasti</li><li>spasi</li><li>chiente</li><li>trano</li><li>dine</li><li>inzia</li><li>aggio</li></ul> |


### Examples of generated names

| FR | DE | SE | FI | ES | PT | IT
| ------------- | ------------- | ------------- | ------------- | ------------- | ------------- | ------------- |
|<ul><li>sylvien</li><li>amile</li><li>céloé</li><li>landrine</li><li>arictore</li><li>lucine</li><li>dorianne</li><li>yanaïs</li><li>théode</li><li>lune</li></ul>| <ul><li>fersierem</li><li>kossite</li><li>inftionde</li><li>briedem</li><li>südliedeller</li><li>rendes</li><li>solt</li><li>vern</li><li>gewandertel</li><li>glechtier</li></ul> | <ul><li>jels</li><li>solov</li><li>till</li><li>sigvard</li><li>halvister</li><li>karid</li><li>gösten</li><li>bens</li><li>britta</li><li>gjorvar</li></ul>| <ul><li>sakka</li><li>helina</li><li>marini</li><li>lauriina</li><li>rikaava</li><li>tomo</li><li>lyydia</li><li>matu</li><li>jorvo</li><li>tari</li></ul>| <ul><li>lorgia</li><li>delorisia</li><li>gualda</li><li>jeno</li><li>tricio</li><li>eugenicio</li><li>jula</li><li>gelina</li><li>margabenico</li><li>raimodro</li></ul> | <ul><li>argil</li><li>anacia</li><li>glaucio</li><li>fabia</li><li>marcelenifa</li><li>telaucio</li><li>franto</li><li>atrico</li><li>eduardo</li><li>alfremodo</li></ul> | <ul><li>berista</li><li>rudisto</li><li>pietto</li><li>graziorgia</li><li>alidina</li><li>marodrina</li><li>calbenzo</li><li>sebio</li><li>nicarda</li><li>romilliano</li></ul>

## Principle
This generator is based on a 2-level [Markov chain](https://en.wikipedia.org/wiki/Markov_chain) system.<br/>
1-level markov chain was not good enough to generate realistic words.<br/>
Thus, we need to take care of the 2 last characters to generate a new one.

The idea is to create a hash based on an input dictionary file.<br/>
**Hash key**: Triplet of characters<br/>
**Hash value**: Number of occurences in the dictionary that the two first characters are followed by the thrid one in a word<br/>

*Example*: Lets say our generated word is being built. It starts with '**st**'. By using this hash, we can see for each possible letter, how many times it appears after the letters '**st**' every word of the dictionary input.d
```
{"sti"=>11855, "ste"=>7903, "sta"=>6218, "str"=>5309, "sto"=>1858, "stu"=>803, "st$"=>44, "std"=>32, "stm"=>27, "stc"=>13, "sts"=>11, "stv"=>9, "stf"=>7, "stb"=>6, "stl"=>6, "sty"=>4, "stp"=>3, "stg"=>2, "stw"=>1}
```

We can then generate a state diagram to have the probability of each character to appear after the two first ones.<br/>
Then, select a random character based on the probability of each one to appear.

## Usage

Params:
- Language: FR,ES,DE,IT...
- Type: 'words' or 'names'
- number: Number of words to generate

```ruby
ruby words_script.rb DE words 15
```

## Dependencies
None

## Supported languages
- FR
- DE
- SE
- FI
- ES
- PT
- IT

## Sources
- Idea based on https://sciencetonnante.wordpress.com/2015/10/16/la-machine-a-inventer-des-mots-video/
- [French words list](http://www.lexique.org/listes/liste_mots.php)
- [German words list](http://www.gwicks.net/dictionaries.htm)
- [Swedish words list](https://github.com/martinlindhe/wordlist_swedish)
- [Finnish words list](https://raw.githubusercontent.com/hugovk/everyfinnishword/master/kaikkisanat.txt)
- [Spanish words list](https://raw.githubusercontent.com/words/an-array-of-spanish-words/master/corpus.txt)
- [Brazilian words list](https://raw.githubusercontent.com/titoBouzout/Dictionaries/master/Portuguese%20(Brazilian).dic)
- [Italian words list](https://raw.githubusercontent.com/napolux/paroleitaliane/master/paroleitaliane/280000_parole_italiane.txt)
- [Names list](https://www.data.gouv.fr/fr/datasets/liste-de-prenoms/)
