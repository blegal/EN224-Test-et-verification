# EN214-Test-et-verification

## Introduction

L'ensemble de la séquence pédagogique est décrite dans les fichiers MarkDown présents dans les repertoire 1, 2 et 3.

Bonne lecture...


## Téléchargement (GUI)

Pour ceux d'entre vous qui sont sous Windows ou MacOS, la méthode la plus simple pour télécharger les fichiers est d'installer l'outil **GitHub Desktop** développé par **GitHub**.

```
https://desktop.github.com
```

Une fois l'outil installé, lancez le. Choisissez **clone repository** et entrez l'adresse suivante:

```
https://github.com/blegal/EN224-Test-et-verification.git
```

![alt text](./icons/warning.png) Evitez de mettre des accents et des espaces dans le chemin. Cela vous évitera des soucis par la suite !


## Téléchargement (CLI)

Pour ceux qui sont sous Linux ou ceux qui adorent les terminaux, le plus simple est d'ouvrir un terminal. Une fois dans le repertoire ou vous souhaitez créer le projet, tapez la commande suivante:

```
git clone https://github.com/blegal/EN224-Test-et-verification.git
```

## Edition et simulation de VHDL sous MacOS (Linux)

Pour les malchanceux qui ont décidé d'acquérir un MAC alors qu'ils doivent écrire du VHDL, il existe toutefois une solution permettant d'analyser et de simuler des codes VHDL.

Les utilisateurs de MacOS auront besoin d'avoir brew (https://brew.sh/index_fr). L'installation de **ghdl** sera réalisé par la commande suivante:

```
brew install ghdl
```

Sous Linux l'utilsation, du gestionnaire de package remplira le meme role:

```
sudo apt install ghdl gtkwave
```

Pour analyser un code VHDL, utilisez la commande **ghdl -a**:

```
ghdl -a ./src/PGCD.vhd
ghdl -a ./src/PGCD_tb.vhd
```

Pour générer un fichier executable permettant de simuler vos modules & lancer la simulation du testbench, il faut utiliser **ghdl -r**:

```
ghdl -r PGCD_tb --vcd=signaux.vcd --stop-time=1000ns
```

Afin d'observer les signaux qui sont mémorisés dans le fichier **signaux.vcd** vous allez devoir passer par un outil externe. Les possesseur de MAC, préféreront surement ScanSion (http://www.logicpoet.com/scansion/) tandis que les utilisateurs  de Linux utiliseront gtkwave (http://gtkwave.sourceforge.net/).