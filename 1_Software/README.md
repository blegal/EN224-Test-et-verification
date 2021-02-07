# Vérification, Assertions & tests unitaires

## Introduction

Cette première séance de TP vise à illustrer les différentes techniques que vous avez pu voir en cours et à vous faire réfléchir aux problèmatiques de vérification durant les étapes de conception.

Toutefois, vous mettrez dans cette partie en pratique ces connaissances et les principes associés que dans le domaine de la conception logicielle. Ce TP s’articule autour de la mise au point et la validation d’une fonction algorihtmique élémentaire. L’utilisation de cette fonction élémentaire possède un avantage et un inconvénient :

- **Avantage** : vous allez vite vous rendre compte que de vérifier quelque chose de simple n’est pas si aisé que cela…

- **Inconvénient** : certaines techniques que vous allez utiliser vont sembler complexes à mettre en œuvre pour un exemple si trivial. Toutefois, votre expérience devrait vous permettre de relativiser ce sentiment vis-à-vis des développements que vous réalisez en entreprise...

A la fin de la séance de TP vous devrez remettre à votre encadrant un rapport de TP (manuscrit) détaillant le code écrit et les techniques de vérification employées. Des commentaires pertinents sur ces techniques et leurs intérêts commenteront chacune des questions traitées. Les différents codes sources développés devront être envoyés par e-mail.

Algorithme de calcul du **PGCD** de 2 nombres entiers :

```
FONCTION PGCD( A, B )
  TANT QUE A /= B ALORS
    SI A > B ALORS
      A = A – B
    SINON
      B = B – A
    FIN ALORS
  FIN TANT QUE
  RENVOYER A
FIN FONCTION
```

Dans cet exercice pédagogique nous considérerons que les données qui doivent être traitées par votre algorithme une fois intégrée dans le système sont bornées dans l'intervalle **[1, 65535]**. En effet pour des valeurs d'entrée beaucoup plus grandes le nombre d'itérations nécessaires afin de faire converger l'algorihtme pourraient être trop important.


## Etape 1

A partir de l'algorithme décrit ci-dessus écrivez une fonction **C/C++** implantatant le calcul du **PGCD** de deux nombres entiers. Le prototype de la fonction que vous devez écrire est fourni ci-dessous:

```
int PGCD(const int A, const int B);
```

Afin de vous aider, le repertoire **Etape_1** contient les fichiers nécessaires à cette tache.

- Reprenez l’algorithme de calcul du PGDC et écrivez la fonction **C/C++** correspondante dans le fichier **main.c**.
- Testez et validez votre code en écrivant un **main** qui d’exécute votre fonction et affiche les résultats dans le terminal.
- Executez votre programme **main** afin de tester un couple de données.
- Maintenant, choississez une dizaine de couples de valeurs permettant de bien tester votre production.

![alt text](../icons/rapport.png) Analyser votre capacité a écrire un programme fonctionnel du premier coup même si l'algorithme est trivial.


## Etape 2

Maintenant que vous avez testé manuellement votre fonction, nous allons utiliser une approche semi-automatisée qui va permettre d'étendre le nombre de tests éffectués.

- Ecrivez deux fonctions (RandA et RandB) qui permettent de générer aléatoirement des valeurs de A et B comprises entre 0 à 65535.

- Utilisez ces 2 fonctions afin de tester votre fonction à l’aide de 20 couples de valeurs différentes.

- Vous vous **assurerez** que les résultats sont corrects.

- Que se passe t'il si vous augmentez le nombre de valeurs testées à 2000 ? Si rien d'étrange ne se produit augmentez le nombre de tests jusqu'à 200000...

- Corrigez ce petit défaut de conception.

:bulb: abc

:information_source: Si vous n'avez pas d'idées du pourquoi (et APRES AVOIR REFLECHI...) faites vous aider par votre enseignant...

:clipboard: Analyser votre capacité a écrire un programme fonctionnel du premier coup même si l'algorithme est trivial.

:warning:

## Etape 3

Le nombre de couples d'entrées possibles pour votre fonction est égale à (65536 * 65536) = 4294836225. Pour le moment vous n'avez testé que 20 valeurs...

- Proposez une solution afin d'étendre le nombre de test éffectué à 65536 valeurs (soit 0,0015% des couples possibles) **sans que vous ayez besoin de valider manuellement les résultats**.

- Modifiez votre code **C/C++** en conséquence.

- Validez le fait que votre implantation de l'algorithme **PGCD** fonctionne sur l'ensemble de ces valeurs aléatoires.

![alt text](../icons/info.png) Si vous n'avez pas d'idées sur l'approche à employer, au bout de quelques minutes (de reflexion), faites vous aider par votre enseignant...

![alt text](../icons/rapport.png) Analyser les avantages et les limitations de l'approche mise en oeuvre.

## Etape 4

Mettez en place les mécanismes d’assertion vus en cours (à partir de la planche 130). Afin de vous assurer que les valeurs d'entrée et de sortie de votre fonction **PGCD** sont toujours cohérentes.

- **Reprenez le code que nous avez écrit durant l'étape 1**.

- Dans un premier temps vous n'insérerez que des pré-conditions.

- Vérifiez que les assertions réalisent bien la tache qui leur est dévolue lors de l'éxécution de votre programme.

- Ensuite, vérifiez que lorsque l’on compile le programme en mode « final » ces dernières disparaissent.

![alt text](../icons/rapport.png) Donnez l’intérêt et les limitaions liés à l'utilisation des pré-conditions dans une fonction.


## Etape 5

Maintenant que vous maitrisez le fonctionnement des assertions dans un programme logiciel:

- Intégrez maintenant toutes les pré-conditions et post-condition possibles dans votre fonction (toujours sans toucher à la partie calculatoire).

- Quel est l’intérêt de mettre des post-conditions dans un code ?

- Quelle est la limite de post-conditions ?

![alt text](../icons/rapport.png) Donnez l’intérêt et les limitaions liés à l'utilisation des post-conditions.


## Etape 6

Développez un programme **main** permettant de réaliser des tests unitaires sur la fonction **PGCD** que vous avez développée.

- Ces tests unitaires devront couvrir un jeu de tests dont le nombre des données ainsi que les valeurs est laissé à votre appréciation.

- Pour faire propre, dans cette question vous allez discociez la fonction PGDC de votre fichier **main.c**. Creéz un fichier **pgcd.h** et **pgcd.c**.

- Développez ce code, modifiez votre **makefile** et validez le bon fonctionnement du système.

Grace à l'étape que vous venez d'effectuer, vous pouver tester facilement votre fonction **PGCD** à chaque fois que vous la modifierez. Ce programme **main** qui vérifie que les résultats d'execution sont toujours valides permet de s'assurer que votre fonction **PGCD** ne régresse pas. On parle de tests de non-régression.

Dans un context industriel, on viendrait enrichir la liste des tests lorsque l'on découvre un bug. Les valeurs problematiques sont ajoutées comme des tests (assert). Les valeurs précédement présentes permettent de vérifier que la correction du bug n'a rien "cassé".

![alt text](../icons/rapport.png) Donnez l’intérêt et les limitaions liés à l'utilisation de tests unitaires lors du développement d'une fonctionnalité.


## Etape 7

La conception de programmes de test tel que celui que vous avez écrit durant l'étape 6 est fréquent lorsque le projet est d'envergure industrielle. Cependant, des frameworks existent afin de simplifier la rédaction et l'analyse des résultats. Nous allons ici utiliser le framework Catch2 (https://github.com/catchorg/Catch2).

Ce framework va vous permettre sans que vous ayez besoin d'écrire une fonction main:

- d'exprimer les séquences de tests,

- de classer vos test en catégories (plusieurs scénarios applicatifs, etc.),

- à l'execution de compter le nombre de tests réussis / échoués,

- etc.

Afin de pouvoir utiliser ce framework écrit en **C++** il va falloir opérer quelques changements dans notre projet. Dans le répertoire étape 7, le fichier **main.c** doit être renommé **main.cpp*. De plus dans le fichier **makefile**, l'invocation de **gcc** a été remplacée par **g++**.

- Ajoutez vos fichiers **pgcd.h** et **pgcd.c** dans le repertoire **src** de l'étape 7.

- Renommez le fichier **pgcd.c** en **pgcd.cpp**.

Maintenant dans le fichier **main.cpp** vous allez décrire les séquences de test. Pour cela, vous allez vous appuyer sur la documentation du framework Catch2 (https://github.com/catchorg/Catch2/blob/devel/docs/tutorial.md).

- Créez 2 *test-cases*:
  - Le premier *test-case* sera en charge de tester le fonctionnement normal de votre fonction **PGCD**.
  - Le second s'occupera des cas particuliers (ex. la valeur zéro).

- Chaque *test-case* sera décomposé en 3 sections:
  - La premiere section se focalisera sur les cas d'usage ou (A > B),
  - La seconde section se focalisera sur les cas d'usage ou (A < B),
  - La deniere section traitera sur les cas d'usage ou (A = B).
  
Une fois la description des séquences de test éffectuées:

- Compilez les codes logiciels à l'aide du makefile fourni.
- Executez le programme ainsi obtenu et observez le résultat.
- Modifiez vos tests afin de faire apparaitre des erreurs lors de l'execution.

![alt text](../icons/rapport.png) Concluez sur l’intérêt et les limitaions liés à l'utilisation d'un framework permettant d'executer des tests unitaires.


## Etape 8

Pour le moment vous avez codé manuellement les valeurs de test apres avoir idéntifié un couple de valeurs puis calculé le résultat attendu. L'approche est éfficace, cependant elle s'avere chronophage si l'on souhaite tester un grand nombre de valeurs.

Afin de simplifier la conception des procédures de test, on utilise quand cela est possible des valeurs provenant de modeles de référence via par exemple l'utilisation de fichiers externes.

Les valeurs présentes dans les fichiers externes (données de référence) sont généralement issues d’une autre implantation de l’algorithme (golden model). Cette implantation de référence est généralement un code logiciel de plus haut niveau (Matlab, Python, etc.).

Dans le cas présent, vous allez:

- Utiliser à votre convenance, *Matlab*, *Excel*, *OpenOffice* ou *LibreOffice* pour générer 65536 triplets ([**A**], [**B**], [**résultat**]).

- Stocker ces données dans 3 fichers de type texte. Ces fichiers seront nommés [**ref_A.txt**], [**ref_B.txt**] et [**ref_C.txt**].

Une fois que ces étapes préparatoires sont terminées:

- **Reprenez le code C que vous avez écrit durant l'étape 6**.

Puis:

- Ecrivez un programme (*main*) permettant de lire les valeurs de **A** et **B** dans les fichiers (**ref_A.txt** et **ref_B.txt**).

- Ecrivez les résultats du calcul du PGDC dans un autre fichier de type texte (**resu_C.txt**).

- Executez votre programme afin de générer votre fichier contenant les résultats.

- Utilisez la commande **diff** ou l'outil **meld** (ou **winmerge** pour ceux étant sous Windows) afin de comparer les résultats théoriques et pratiques (**ref_C.txt** et **resu_C.txt**).

![alt text](../icons/rapport.png) Une fois de plus, vous conclurez sur l’intérêt et les limitaions de l'approche...

<!-- 
- Quels sont les avantages et les inconvénients de cette approche par rapport à la génération aléatoire de valeurs de test ?
-->

# Annexes


## Les cas particuliers...

En considérant que tout nombre entier est un diviseur de zéro (car 0 × b = 0 quel que soit b) il vient que, pour tout entier non nul b, PGCD(0, b) = PGCD(b, 0) = b.

La définition usuelle ne permet pas de définir PGCD(0, 0) puisqu'il n'existe pas de plus grand diviseur de 0. On pose par convention : PGCD(0, 0) = 0.


## Une autre approche

Voici une autre approche permettant de calculer la valeur du **PGCD** entre 2 nombres (*N1*, *N2*).

- Assignez à *N1* la valeur de *N2* et à *N2* la valeur du reste de la division de *N1* par *N2*;

- Recommencez jusqu'à ce que le reste de la division soit nul. 

- A ce moment, *N1* contient le **PGCD**.

**Exemple**: Si *N1* vaut 14 et *N2* vaut 32, on obtient successivement

| Iter. | N1  | N2            |
| ----- |:---:| -------------:|
|     1 |   14 | 32           |
|     2 |   32 | 14=14 mod 32 |
|     3 |    4 | 2=14 mod 4   |
|     4 |    2 | 2=4 mod 2    |
|     5 |    2 | 0=2 mod 2    |
