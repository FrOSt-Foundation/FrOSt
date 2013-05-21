# Organisation de FSF

## Fonctionnement général

FSF est inspiré des systèmes de fichiers Unix, avec les metadonnées
(regroupées dans une inode) séparées du contenu. Plusieurs chemins du
système de fichier peuvent pointer sur la même inode, donc sur le même
contenu, celui-ci sera alors accessible par plusieurs chemins. Les
répertoires sont aussi des fichiers, leur contenu est alors la liste
des sous-fichiers.

### Inodes

Elles sont identifiées par un numéro qui dépend de leur position dans
le groupe de blocs d'inodes. L'inode 0 correspond à la racine du
système de fichier (/).

Exemples :

 * inode 0 : première inode du premier bloc.
 * inode 638 : 638 = 4*128+126, c'est l'inode 126 (offset 503) du 4è bloc.

Le nombre de liens durs sert contabiliser le nombre de chemins qui
pointent sur l'inode. Il est incrémenté par création de liens (par
exemple en créant un fichier) et décrément par suppression de lien. Le
contenu et l'inode ne sont supprimés que quand ce compteur atteint 0.


### Répertoires

Un répertoire est un type de fichier particulier. Il possède une
inode, et son contenu liste les fichiers et répertoires qu'il
contient. Ils sont regroupés dans une suite de blocs définis comme
suit :

nombre de mots | description
-------------- | -----------
1              | taille du bloc 
1              | type de fichier
1              | taille du nom
x              | nom

La taille du bloc est par exemple de 6 avec un nom de 3
mots. Lorsqu'un bloc est supprimé (sauf si c'est le dernier), la
taille du bloc précédent est augmentée pour combler l'espace vide,
ceci afin de limiter la fragmentation du contenu du répertoire.

Chaque répertoire contient au minimum 2 fichiers :

 * '.' pointant sur le répertoire courant ;
 * '..' pointant sur le répertoire parent. Dans le cas de /, .. pointe
   du l'inode 0. Cette caractéristique peut être dynamiquement
   modifiée si le système de fichiers n'est pas monté à la racine du
   VFS.

#### Type de fichier

TODO : normal, répertoire, exécutable, lien symbolique


### Liens symboliques

Ce sont des fichiers avec un type spécial dont le contenu est un
chemin d'accès vers un autre fichier.


## Répartition des blocs

<!--Les offsets de blocs commencent à 0 ou 1 ?-->

offset  | nombre de blocs | description
------  | --------------- | -----------
0       | 1               | méta-bloc
1-10    | 10              | blocs d'inodes
11-42   | 32              | blocs d'adresse
42-1442 | 1397            | blocs de données


### Meta-bloc

offset  | nombre de mots | description
------  | -------------- | -----------
0-2     | 3              | mots magiques
3       | 1              | version FS
4-83    | 80             | bitmap des blocs d'inodes (8 bit par bloc)
84-115  | 32             | bitmap des blocs d'adresse (1 bit par bloc)
116-203 | 88             | bitmap des blocs de données
204     | 1              | nombre d'inodes libres
205     | 1              | nombre de blocs de données libres
206     | 1              | taille du nom du disque
207-?   | variable       | nom du disque


### Bloc d'inode

Chaque bloc contient 128 inodes. Chaque inode fait 4 mots.

#### Format des inodes

offset | description
------ | -----------
0      | type (voir plus bas)
1      | adresse du bloc mémoire
2      | taille
3      | nombre de liens durs


### Bloc d'adresse
sous-bloc 32 mots
16 sous-blocs
32 blocs


## Format des adresses de bloc

Un ensemble de masques définit sur quoi pointe une adresse :

 * 0000 0111 1111 1111 : bloc
 * 0000 1000 0000 0000 :
   * 0 : bloc complet
   * 1 : sous bloc
 * 1111 0000 0000 0000 : offset du sous-bloc
  
Un sous-bloc consiste en un fragment de 32 mots d'un bloc de 512.

Chaque fichier possède dans son inode une adresse qui correspond soit
à un bloc de donnée (AND 0X0800 == 0) soit à un bloc d'adresse (32
mots). Ces blocs contiennent jusqu'à 32 adresses correspondant elles
aussi à des blocs adresses ou données.


## Exemples

### Création de fichier vide

 1. localisation d'une inode libre
 2. chargement du bloc d'inode correspondant
 3. écriture de l'inode
 4. chargement du contenu du répertoire
 5. ajout d'un bloc (nom+type du fichier) à la fin
 6. si pas d'erreur, sauvegarde des blocs et mise à jour du méta-bloc


### Accès au contenu d'un fichier à partir de l'inode

 1. chargement du bloc inode correspondant
 2. lecture du mot 4
 3. détermination de la liste des blocs données (cf fonctionnement
 adresses)


### Suppression d'un fichier à partir de l'inode

 1. Suivant le nombre de liens durs :
   * si nombre de lien > 1, nbre-- et suppression de la référence dans
 le répertoire
   * sinon accès à la liste des blocs données
 2. maj de la bitmap bloc données (pas de suppression)
 3. maj de la bitmap bloc adresses (idem)
 4. maj de la bitmap inode (re idem ^^)


### Défragmentation

 * rassemblement des inodes
 * simplification des adresses (utilisation d'un nombre de bloc adresse minimum)
 * éventuelement rassemblement des blocs données
 * réduction de la taille du contenu des répertoires (cf plus haut, lors de la suppression d'une entrée
	

## Commentaires

 * Améliorable ^^
 * Liens symboliques à définir
 * Avantages :
   * inodes : 4 mots -> peu de blocs à charger (cache) si fragmentation faible
   * répertoires : tous les noms de fichiers sont regroupés dans 1+
	bloc
 * Inconvénients :
   * limite de 1280 fichiers ou répertoires, les liens dur ne comptent pas
   * nombre limité de blocs adresse : risque de manque si beaucoup de
     fichiers utilisent 2 adresses données (si 1, elle est contenue
     dans l'inode)
