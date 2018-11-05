# Vérification, Assertions & tests unitaires

## Introduction

Cette première séance de TP vise à illustrer les différentes techniques que vous avez pu voir en cours et à vous faire réfléchir aux notions de test de de vérification.

Toutefois, vous mettrez en pratique ces connaissances et les principes associés que dans le domaine de la conception logicielle. Ce TP s’articule autour de la mise au point et la validation d’une fonction élémentaire. L’utilisation de cette fonction élémentaire possède un avantage et un inconvénient :

-	**Avantage** : vous allez vite vous rendre compte que de vérifier quelque chose de simple n’est pas si simple…

-	**Inconvénient** : certaines techniques que vous allez utiliser vont sembler complexes à mettre en œuvre pour un exemple si trivial. Toutefois, votre expérience devrait vous permettre de relativiser ce sentiment vis a vis des développements que vous réalisez en entreprise.

A la fin de la séance de TP vous devrez remettre à votre encadrant un rapport de TP (manuscrit) détaillant le code écrit et les techniques de vérification employées. Des commentaires pertinents sur ces techniques et leurs intérêts commenteront chacune des questions traitées.

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

Dans cet exercice pédagogique nous considérerons que les données que doit traiter votre algorithme [0, 65535]. En effet pour des valeurs d'entrée beaucoup plus grandes ne nombre d'itérations nécessaire afin de faire converger l'algorihtme pourraient être  

## Etape 1

A partir de l'algorithme décrit ci-dessus écrivez une fonction **C** implantatant le calcul du PGCD de deux nombres entiers. Le prototype de la fonction que vous devez écrire est fourni ci-dessous:

```
int PGCD(const int A, const int B);
```

Afin de vous aider dans cette tache, le repertoire **Etape_1** contient les fichiers nécessaires à cette tache.

- Reprenez l’algorithme de calcul du PGDC et écrivez la fonction C correspondante dans le fichier **main.cpp**.
- Testez et validez votre code en écrivant un **main** qui d’exécute votre fonction et affiche les résultats dans le terminal.
- Choississez une dizaine de couples de valeurs permettant de bien tester votre production.

## Etape 2

Ecrivez deux fonctions (RandA et RandB) qui permettent de générer aléatoirement des valeurs de A et B (entre 0 à 255) afin d’augmenter le nombre de tests appliqués à votre fonction. Utilisez ces 2 fonctions afin de tester votre fonction à l’aide de 20 couples de valeurs différentes.

## Etape 3

Mettez en place les mécanismes d’assertion vus en cours. Dans un premier temps vous ne vous préoccuperez que des pré-conditions. Vérifiez que les assertions réalisent bien leur travail. Vérifiez que lorsque l’on compile le programme en mode « final » ces dernières disparaissent. Quel est l’intérêt de mettre des pré-conditions dans un code ?

## Etape 4

Intégrez maintenant toutes les pré-conditions et post-condition possibles dans votre fonction (sans toucher à la partie calculatoire). Quel est l’intérêt de mettre des post-conditions dans un code ? Quelle est la limite de post-conditions ?

## Etape 5

Maintenant nous allons considérer que cette fonction ne doit travailler (dans le projet courant) qu’avec des nombres dont les valeurs numériques varient entre 1 et 1025 pour A et 2 et 2049 pour B. Intégrez ces hypothèses dans votre programme et vérifiez votre fonction.

## Etape 6

Développez un programme permettant de réaliser des tests unitaires sur la fonction que vous venez de développer. Ces tests unitaires devront couvrir un jeu de tests dont le nombre des données ainsi que les valeurs est laissé à votre appréciation. Développez le code et validez le.

## Etape 7

Afin de simplifier le test de composants (fonctions) pouvant être utilisés dans plusieurs projets, on utilise souvent des fichiers externes. Ecrivez un programme (main) permettant de lire les valeurs de A et B dans un fichier (texte) et écrivant les résultats dans un autre fichier (texte). Placez les résultats théoriques dans un fichier nommé ref.txt et utilisez la commande diff afin de comparer les résultats théoriques et pratiques.

## Etape 8

Les valeurs présentes dans le fichier ref.txt sont généralement issues d’une autre version de l’algorithme (code Matlab par exemple). Cette approche permet d’utiliser une « golden model » lors de la conception d’un code d’implantation
