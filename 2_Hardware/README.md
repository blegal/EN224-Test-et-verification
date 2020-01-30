# Back to VHDL design :-)

Maintenant que vous êtes devenus des experts de la vérification de composants logiciels, nous allons nous intéresser à l'application des mêmes méthodes dans le domaine du matériel.

## Etape 1

Ecrivez un module VHDL permettant d'implanter le calcul du PGCD de manière itérative. Afin d'uniformiser le développement de vos modules VHDL, vous utiliserez le prototype suivant:

```
ENTITY PGCD IS
PORT ( 
	CLK      : in  STD_LOGIC;
	RESET    : in  STD_LOGIC;

	idata_a  : in  STD_LOGIC_VECTOR (31 downto 0);
	idata_b  : in  STD_LOGIC_VECTOR (31 downto 0);
	idata_en : in  STD_LOGIC;

	odata    : out STD_LOGIC_VECTOR (31 downto 0);
	odata_en : out STD_LOGIC
);
END PGCD;
```

- Lancez l'outil Vivado et créez un projet ciblant le FPGA disponible sur la carte Nexys-4.
- Décrivez votre module PGDC en langage VHDL.
- Ecrivez un testbench permettant de vérifier son bon fonctionnement. Dans un premier temps vous limiterez cette approche à 3 ou 4 couples de valeurs.

## Etape 2

Maintenant que vous possédez, une version fonctionnelle du module de calcul du PGDC vous pouvez commencer l'instrumentation de votre code source à l'aide d'assertions.

- Inserez dans votre module les mêmes assertions que celles que vous avez utilisées dans votre code **C/C++**.
- Vérifiez le bon fonctionnement du module instrumenté.

## Etape 3

Afin de vérifier de manière plus convaincante votre module VHDL, il est nécessaire d'étendre le nombre de valeurs de test. Pour cela, une solution pertinante consiste à récuperer des données "fiables" de fichiers externes.

- Modifiez votre testbench afin de lire les données de test depuis les fichiers générés par votre programme en **C/C++**.
- Afin de simplifiez l'analyse des résultats, vous prendrez soin d'inserer un processus de comparaison automatiques des résultats. Pour chaque comparaison effectuée, ce dernier affichera dans la console, le nombre de tests éffectués et le nombre d'erreurs détectées.

https://www.nandland.com/vhdl/examples/example-file-io.html

## Etape 4

Afin de mieux comprendre le fonctionnement du module en simulation et surtout estimer ses performances nous souhaitons connaitre le nombre de cycles d'horloge nécessaires à chaque calcul de PGDC.

- Ajoutez dans votre module PGCD les lignes de codes nécessaires afin d'implanter cette nouvelle fonctionnalité.
- Un affichage dans le terminal fournira a la fin de chaque calcul le temps nécessaire à sa complétion.

**Note:** Afin de ne pas dégrader les performances du module post-synthèse vous prendrez soin d'insérer les annotations suivantes aux endroits pertinants.

```
-- pragma translate_on
-- pragma translate_off
```

## Etape 5

Les résultats fournis par le moniteur que vous venez d'inserer dans votre module démontrent qu'il peut être nécessaire d'attendre jusqu'à 65535 cycles d'horloge avant qu'une donnée ne soit calculée... Ce délai est bien trop long :-(

- Proposez une solution permettant de réduire au moins d'un facteur 16 cette durée.
- A l'aide des bancs de test dévelopés précédement, validez la nouvelle implantation de votre module.

## Etape 6

Toutes les étapes de vérification que nous avons déployé jusqu'à maintenant vous ont permis de valider en simulation votre composant. Toutefois, en simulation certains défaut peuvent ne pas apparaitre. Afin de s'assurer du bon fonctionnement de votre circuit nous allons donc faire une vérification sur carte FPGA.

Afin de vous simplifier la vie, votre enseignant met à votre disposition les outils nécessaires à la communication avec la carte Nexys-4.

- Ajoutez les fichiers VHDL présents dans le repertoire Etape_7 à votre projet Vivado.
- Ajoutez le fichier de contraintes dédié à la carte Nexys-4.
- Lancez la génération du bitstream.
- Une fois toutes ces étapes réalisées, configurer le FPGA à l'aide du bitstream.

Afin de transmettre des données sur la carte, vous devrez compiler et executer le programme **C/C++** se trouvant dans le repertoire **c_codes**.

- Mettez en place la manipulation et validez le bon fonctionnement du système.

## Etape 7

L'approche employée pour valider le système sur carte est comme vous vous en doutez insuffisante...

- Proposez une approche **originale** et **personnelle** afin de solutionner ce problème.

## Etape 8

Afin de mettre au point un système numérique sur carte, il est parfois nécessaire d'analyser ce qui s'y passe en **temps réel**. Jusqu'à maintenant pour y arriver vous avez ressorti la valeur des signaux internes sur des LEDS, etc.  Cependant, vous avez pu constatez que ces approches sont chronophrages et limitées !

Dans cette derniere partie, nous allons nous interesser à l'analyse en temps réel des données traitées par notre module PGDC.

Pour cela, référez vous au document de référence produit par Xilinx ([UG908](https://www.xilinx.com/support/documentation/sw_manuals/xilinx2015_4/ug936-vivado-tutorial-programming-debugging.pdf)). Les informations essentielles sont situées à partir de la page 32.

- Utilisez cette technique afin d'observer en temps réel le traitement de vos données dans le module PGDC.
- Concluez sur les avantages et les inconvénients de cette approche.
