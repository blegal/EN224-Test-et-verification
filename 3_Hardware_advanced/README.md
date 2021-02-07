# Code coverage et architectures matérielles

L’environnement logiciel utilisé pour ce TP est ModelSim avec le langage de description matériel VHDL. L’objectif de ce TP est d’analyser l’intérêt et la puissance des outils de type code coverage.

**Rappel** : code coverage = analyse non statique (stimuli obligatoires)


## Etape 1 :

Dans cette première étape, vous allez prendre en main l'outil ModelSim. Pour cela vous allez réutiliser les fichiers developpés pour votre module PGDC.

- Créer un projet modelsim.
- Ajoutez les fichiers VHDL au projet.
- Compilez les fichiers que vous venez d'ajouter. 
- Puis lancez la simulation de votre module.

**Note**: Si vous avez perdu les lignes de commande magiques depuis l'an dernier, vous les retrouverez ci-dessous.

```
export LM_LICENSE_FILE=1700@johnny
export LD_LIBRARY_PATH=/opt/mentor/modelsim_se/10.3d/optlib
alias modelsim='/opt/mentor/modelsim_se/10.3d/modeltech/linux_x86_64/vsim -gui'
```

Comme vous vous en doutiez, votre module qui fonctionnait avec ISim fourni aussi des résultats corrects avec ModelSim. L'interet de l'exercice est ailleurs ;-)

- Maintenant, compilez les fichiers VHDL en mode coverage (instrumentation du code) à l'aide de la commande suivante:

```
vcom -coverAll PGDC.vhd tb_PGDC.vhd
```

**Note** : il est possible d'activer le mode coverage en cliquant du bouton droit sur les fichiers dans l'interface de ModelSim puis en sectionnant les cases adéquates dans l’onglet proprieties.

- Chargez et lancez la simulation à l'aide des commandes suivantes:

```
vsim –coverage bench_compteur
run –all
```

- Analyser les différents informations de code coverage fournies dans l'interface de  ModelSim.

Différents types de code coverage sont possibles avec ModelSim:

- L’outil renseigne directement le code source quant au nombre d’exécutions de chaque instruction (placer la souris sur l’instruction)

- La fenêtre « missed coverage » renseigne spécifiquement sur les structures (statement, branch, …) non exécutées. (cliquer sur la ligne affichée dans missed coverage pour avoir des informations (Details) sur la non-exécution de la structure en question)

- La fenêtre « instance coverage » indique les différents taux de couverture.

- Il est également possible d’avoir le détail des basculements des signaux (toggle coverage). Pour cela, il faut ouvrir une fenêtre objects (view>objects), puis cocher (tools>toggle coverage>add>signals in design). Attention, cette manipulation est à faire avant de compiler et de lancer la simulation.


Normalement, si vous avez bien fait votre travail dans la partie précédente vous devez obtenir de tres hauts scores dans toutes les catégories. En même temps, vu la structure de votre module PGDC, ce n'est pas tres difficile ;-)

## Etape 2

Pour vous permettre de vous entrainer un peu, vous allez maintenant utiliser les fichiers issue du module nommé **composant**.

- Creez un nouveau projet ModelSim et appliquez la même procédure que celle employée dans l'étape 1.

Partie 2 : la vérification, « c’est pas un problème !»
Le fichier C2.vhd correspond au schéma ci-dessous.

## Etape 3

Arretons de jouer avec des exemples pédagogiques... Durant vos semestres à l'école vous avez developpé pas mal de VHDL ! Il est temps maintenant d'analyser la qualité de vos procedures de test.

- Reprenez un ou deux projets que vous avez développés et appliquez une analyse sur vos procédure de test.

- Essayer de maximiser le taux de couverture des testbench que vous aviez écrit avant de suivre ce cours.

## Pour allez plus loin...

Nous venons d'étudiez la mise en application de l'analyse de la couverture de code à des projets décrits en VHDL. Cepednant les outils de codevarge sont aussi employé dans le monde du logiciel.

- Essayez d'appliquer ces outils sur le code **C** développé lors de la première séance. Pour cela basez vous sur les tutoriaux suivants : [[1]](https://en.wikipedia.org/wiki/Gcov), [[2]](https://www.tutorialspoint.com/unix_commands/gcov.htm), [[3]](https://connect.ed-diamond.com/GNU-Linux-Magazine/GLMF-154/Tests-unitaires-avec-Check-Gcov-et-Lcov).

- Faites de même pour vos codes **C/C++** développés plus tot dans votre scolarité.


# Annexes (à réintégrer un jour ?)

## Etape 2

Vérifier le fonctionnement de C2 par une simulation en mode normal (sans code coverage) en complétant le fichier test-bench c2_sim.vhd.
Modifier C2.vhd si nécessaire pour que C2 fonctionne (soit simulable).

Peut-on garantir que C2 fonctionne bien avec les quelques stimulus utilisés ?  Passer en mode coverage et observer entre autre les taux de couverture.  Un taux de couverture de 100% signifie-t-il que tout à été vérifié ?

Partie  3 :  la vérification, « c’est pas un problème » (bis)
Le fichier Operateur_3.vhd correspond à un multiplieur en format flottant IEEE-754 32 bits (A*B).
Pour ce rendre compte de la complexité de l’étape de vérification (peut-on vraiment dire que ce qui a été développé est fonctionnellement correct ?), on se propose d’analyser ce fichier.
On ne possède malheureusement pas de modèle de référence exécutable du multiplieur flottant mais seulement de quelques valeurs pour la vérification (voir dernière page de ce document) et des quelques informations ci-dessous concernant le format flottant.
Quelques erreurs ont été faites lors du codage (Operateur_3), (mais on suppose qu’on ne le sait pas).

On veut vérifier qu’Opérateur_3 est fonctionnellement correct. Créer un fichier de test_bench avec quelques stimuli pour cela. Vérifier les valeurs résultats et bien sur faire une analyse code coverage.
