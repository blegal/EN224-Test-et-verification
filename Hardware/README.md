Vérification – Code coverage

L’environnement logiciel utilisé pour ce TP est ModelSim avec le langage de description matériel VHDL. L’objectif de ce TP est d’analyser l’intérêt d’outils de type code coverage.
Rappel :  code coverage   analyse non statique (stimuli obligatoire)

Les différents fichiers .vhd utilisés se trouvent sur le le serveur WEB de l’école et plus particulièrement sur le site pédagogique de votre enseignant dans la partie « TP de Test ».

http://uuu.enseirb.fr/~legal/download/Electronique/Test_Verification/

Créez un répertoire sur votre compte et copiez les fichiers.

Partie  1 : prise en main, généralités
1) Créer un projet modelsim, compiler les fichiers compteur.vhd et bench_compteur.vhd (test-bench du compteur) et lancer la simulation (bench_compteur) pour vérifier le bon fonctionnement du compteur.

2) Maintenant, compilez les fichiers en mode coverage (instrumentation du code) :
vcom -coverAll compteur.vhd bench_compteur.vhd

Remarque: il est possible de spécifier le mode coverage en cliquant du bouton droit sur les fichiers puis en sectionnant les cases adéquates dans l’onglet proprieties.

charger la simulation de l’entity bench_compteur :
vsim –coverage bench_compteur

puis lancer la simulation :
run –all
Note : il est bien entendu possible d’analyser pas à pas la simulation (run [-…])

Analyser les différents outils de code coverage disponibles sous ModelSim.


====================================

Différents types de code coverage sont possibles avec ModelSim.


L’outil renseigne directement le code source quant au nombre d’exécutions de chaque instruction (placer la souris sur l’instruction)

La fenêtre « missed coverage » renseigne spécifiquement sur les structures (statement, branch, …) non exécutées. (cliquer sur la ligne affichée dans missed coverage pour avoir des informations (Details) sur la non-exécution de la structure en question)

La fenêtre « instance coverage » indique les différents taux de couverture.

Il est également possible d’avoir le détail des basculements des signaux (toggle coverage) :
Ouvrir une fenêtre objects (view>objects)
Afficher (tools>toggle coverage>add>signals in design) (à faire avant de lancer la simulation)  





3) Le fichier compteur précédent ne permet pas d’exploiter le « condition coverage ». Créer un nouveau projet, compiler les fichiers composent.vhd et sim_composent.vhd en mode coverage et lancer la simulation. Analyser les résultats du coverage. Observer les « missed conditions » entre autre. Modifier le testbench pour avoir les plus grands taux de couverture (100%) sans pour autant exécuter toutes les combinaisons des données d’entrée.


Partie  2 : la vérification, « c’est pas un problème !»
Le fichier C2.vhd correspond au schéma ci-dessous.


Vérifier le fonctionnement de C2 par une simulation en mode normal (sans code coverage) en complétant le fichier test-bench c2_sim.vhd.
Modifier C2.vhd si nécessaire pour que C2 fonctionne (soit simulable).

Peut-on garantir que C2 fonctionne bien avec les quelques stimulus utilisés ?  Passer en mode coverage et observer entre autre les taux de couverture.  Un taux de couverture de 100% signifie-t-il que tout à été vérifié ?

Partie  3 :  la vérification, « c’est pas un problème » (bis)
Le fichier Operateur_3.vhd correspond à un multiplieur en format flottant IEEE-754 32 bits (A*B).
Pour ce rendre compte de la complexité de l’étape de vérification (peut-on vraiment dire que ce qui a été développé est fonctionnellement correct ?), on se propose d’analyser ce fichier.
On ne possède malheureusement pas de modèle de référence exécutable du multiplieur flottant mais seulement de quelques valeurs pour la vérification (voir dernière page de ce document) et des quelques informations ci-dessous concernant le format flottant.
Quelques erreurs ont été faites lors du codage (Operateur_3), (mais on suppose qu’on ne le sait pas).

On veut vérifier qu’Opérateur_3 est fonctionnellement correct. Créer un fichier de test_bench avec quelques stimuli pour cela. Vérifier les valeurs résultats et bien sur faire une analyse code coverage.

 
================================================

Quelques informations sur les flottants :

Principe :  
