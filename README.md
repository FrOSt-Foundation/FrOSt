# FrOSt

FrOSt is a free operating system under the free license GNU GPL, made
by a tiny group of french people.  We worked hard on it, and are proud
to release it.

We would be very pleased to know how you use or modify it, and we
would be very grateful to you if you informed your users what your
operating system is based on. :) You can also thank us for our job by
sending us bugreports, fixes, enhancements, t-shirts, money, beer &
pizza on our [forum](http://frost-0x10c.tk/Forum/index.php).


## Qu'est-ce que FrOSt ?

FrOSt est un projet communautaire français ayant pour but de créer un
OS libre français pour le jeu 0x10c de Notch


## Comment lancer FrOSt ?

Il faut compiler le fichier FrOSt/FrOSt.dasm, de préférence avec
DevCPU.


## Comment puis-je développer un logiciel pour cet OS ?

Le wiki du projet contient toutes les informations utiles à ce sujet


## Comment contribuer

### IDE

Nous utilisons git comme gestionnaire de version (voir plus bas pour
un tuto).

Nous utilisons actuellement
[DevCPU](http://0x10c.fr/index.php?threads/nouvel-%C3%A9mulateur-ide-devcpu.989/#post-34568). Marche
à suivre pour ajouter le projet :

* Cloner le projet sur votre ordi
* Importer le projet (clic droit > import > existing project into
  workspace, puis sélectionner le dossier FrOSt)


### Normes de codage

#### Règles générales

* git gère les LF/CRLF, pas de soucis à se faire de ce côté là.
* __Documentez__ votre code ! Il sera plus facile à maintenir et
  comprendre par la suite.
* Faites des commits simples et clairs : une modification par
  commit. Par exemple, 'Diverses modifications des drivers' peut
  surement être découpé en plusieurs commits
* N'hésitez pas à utiliser les branches pour toute modification
  utilisant plus d'un commit (cf règle précédente). Cela permet aux
  autres développeurs de mieux comprendre votre travail.
* N'hésitez pas à relire et commenter les commits des autres. Le code
  résultant n'en sera que meilleur.
  

#### Normes

* Les instructions (set, add, mul…) sont en minuscule
* Les registres + POP, PUSH, PEEK sont écrits an majuscule (pour les
  différencier des labels
* Les opérandes sont séparés par une virgule et une espace (cf
  exemples)
* Les labels sont écrits ainsi : routine_bouclePrincipale_sousBoucle

Exemple :

```dasm
	set A, B
	add PEEK, [id_processus]
	jsr maRoutine_loop
```

### Branches disponibles :

* master : c'est la branche principale, elle n'est modifiée que pour
  des releases du projet.
* indev : c'est une branche de développement, qui ne devrait être
  utilisée que par ceux qui connaissent.  /!\ Peut ne pas fonctionner,
  et sera de toute façon plus ou moins bugguée.
* D'autres branches temporaires peuvent apparaitre


## Liens utiles

[Dernières spécifications du DCPU-16 et du hardware](http://dcpu.com/)

[Tuto git](http://git-scm.com/book/fr)


## Credits :

* Alocer
* ElectricBanana
* Faërie
* Franck97
* natnat
* Yamakaky
* Earth75
