# Vérification, Assertions & tests unitaires

## Introduction

Cette première séance de TP vise à illustrer les différentes techniques que vous avez pu voir en cours et à vous faire réfléchir aux notions de test de vérification.

Toutefois, vous mettrez en pratique ces connaissances et les principes associés que dans le domaine de la conception logicielle. Ce TP s’articule autour de la mise au point et la validation d’une fonction élémentaire. L’utilisation de cette fonction élémentaire possède un avantage et un inconvénient :

- **Avantage** : vous allez vite vous rendre compte que de vérifier quelque chose de simple n’est pas si simple…

- **Inconvénient** : certaines techniques que vous allez utiliser vont sembler complexes à mettre en œuvre pour un exemple si trivial. Toutefois, votre expérience devrait vous permettre de relativiser ce sentiment vis a vis des développements que vous réalisez en entreprise...

A la fin de la séance de TP vous devrez remettre à votre encadrant un rapport de TP (manuscrit) détaillant le code écrit et les techniques de vérification employées. Des commentaires pertinents sur ces techniques et leurs intérêts commenteront chacune des questions traitées. Les différents codes sources développés devront être envoyés par e-mail.

Algorithme de calcul du PGCD de 2 nombres entiers :

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

Dans cet exercice pédagogique nous considérerons que les données qui doivent être traitées par votre algorithme sont bornées dans l'intervalle **[0, 65535]**. En effet pour des valeurs d'entrée beaucoup plus grandes le nombre d'itérations nécessaires afin de faire converger l'algorihtme pourraient être trop important.

## Etape 1

A partir de l'algorithme décrit ci-dessus écrivez une fonction **C/C++** implantatant le calcul du PGCD de deux nombres entiers. Le prototype de la fonction que vous devez écrire est fourni ci-dessous:

```
int PGCD(const int A, const int B);
```

Afin de vous aider dans cette tache, le repertoire **Etape_1** contient les fichiers nécessaires à cette tache.

- Reprenez l’algorithme de calcul du PGDC et écrivez la fonction **C/C++** correspondante dans le fichier **main.cpp**.
- Testez et validez votre code en écrivant un **main** qui d’exécute votre fonction et affiche les résultats dans le terminal.
- Executez votre programme **main** afin de tester un couple de données.
- Maintenant, choississez une dizaine de couples de valeurs permettant de bien tester votre production.

## Etape 2

Maintenant que vous avez testé manuellement votre fonction, nous allons utiliser une approche semi-automatisée qui va permettre d'étendre le nombre de tests éffectués.

- Ecrivez deux fonctions (RandA et RandB) qui permettent de générer aléatoirement des valeurs de A et B comprises entre 0 à 65535.
- Utilisez ces 2 fonctions afin de tester votre fonction à l’aide de 20 couples de valeurs différentes.
- Vous vous **assurerez** que les résultats sont corrects.
- Que se passe t'il si vous augmentez le nombre de valeurs testées à 2000 ?

## Etape 3

Le nombre de couples d'entrées possibles pour votre fonction est égale à (65536 * 65536) = 4294836225. Pour le moment nous n'avons testé que 20 valeurs...

- Proposez une solution afin d'étendre le nombre de test éffectué à 65536 valeurs (soit 0,0015% des couples possibles).
- Modifiez votre code **C/C++** en conséquence.
- Validez le fait que votre implantation de l'algorithme PGCD fonctionne sur l'ensemble de ces valeurs aléatoires.

**Note**: Si vous n'avez pas d'idées sur l'approche à employer... Au bout de quelques minutes, faites vous aider par votre enseignant...

## Etape 4

Mettez en place les mécanismes d’assertion vus en cours. Afin de vous assurer que les valeurs d'entrée et de sorite de votre fonction PGCD sont toujours cohérentes.

- Dans un premier temps vous n'insérerez que des pré-conditions.
- Vérifiez que les assertions réalisent bien leur travail lors de l'éxécution de votre programme.
- Ensuite, vérifiez que lorsque l’on compile le programme en mode « final » ces dernières disparaissent.
- Quel est l’intérêt de mettre des pré-conditions dans un code ?

## Etape 5

Maintenant que vous maitrisez le fonctionnement des assertions dans un programme logiciel:

- Intégrez maintenant toutes les pré-conditions et post-condition possibles dans votre fonction (sans toucher à la partie calculatoire).
- Quel est l’intérêt de mettre des post-conditions dans un code ?
- Quelle est la limite de post-conditions ?

## Etape 6

Développez un programme **main** permettant de réaliser des tests unitaires sur la fonction PGCD que vous avez développée.

- Ces tests unitaires devront couvrir un jeu de tests dont le nombre des données ainsi que les valeurs est laissé à votre appréciation.
- Développez ce code et validez le.

## Etape 8

Afin de simplifier le test de composants (fonctions) pouvant être utilisés dans plusieurs projets, on utilise souvent des valeurs provenant de fichiers externes.

- Ecrivez un programme (main) permettant de lire les valeurs de **A** et **B** dans un fichier (texte) et écrivant les résultats dans un autre fichier (texte).
- Placez les résultats théoriques du calcul du PGCD dans un fichier nommé **ref.txt** 
- Executez votre programme afin de générer votre fichier de contenant vos résultats.
- Utilisez la commande **diff** afin de comparer les résultats théoriques et pratiques.

Les valeurs présentes dans le fichier **ref.txt** sont généralement issues d’une autre implantation de l’algorithme à étudier (du code Matlab par exemple). Cette approche permet d’utiliser un « golden model » lors de la conception d’un code d’implantation

- Quels sont les avantages et les inconvénients de cette approche par rapport à la génération aléatoire de valeurs de test ?

# Annexes

Voici une autre approche permettant de calculer la valeur du PGCD entre 2 nombres (N1, N2).

- Assignez à N1 la valeur de N2 et à N2 la valeur du reste de la division de N1 par N2;
- Recommencez jusqu'à ce que le reste de la division soit nul. 
- A ce moment, N1 contient le PGCD.

**Exemple**: Si N1 vaut 14 et N2 vaut 32, on obtient successivement

- N1			N2
- 14			32
- 32			14=14 mod 32
- 14			4=32 mod 14
- 4			2=14 mod 4
- 2			2=4 mod 2
- 2			0=2 mod 2