# PROJET FIL ROUGE

## **1) Partie 1: Introduction**

La société **IC GROUP** souhaite mettre sur pied un site web vitrine devant permettre d’accéder à ses 02 applications phares qui sont :  

1) Odoo et 
1) pgAdmin 

**Odoo**, un ERP multi usage qui permet de gérer les ventes, les achats, la comptabilité, l’inventaire, le personnel …  

Odoo est distribué en version communautaire et Enterprise. ICGROUP souhaite avoir la main sur le code et apporter ses propres modifications et customisations ainsi elle a opté pour l’édition communautaire.  Plusieurs versions de Odoo sont disponibles mais celle retenue est la 13.0 car elle intègre un système de LMS (Learning Management System) qui sera utilisé pour publier les formations en internes et ainsi diffuser plus facilement l’information.  

Liens utiles : 

- Site officiel :[ https://www.odoo.com/ ](https://www.odoo.com/) 
- GitHub officiel:[ https://github.com/odoo/odoo.git ](https://github.com/odoo/odoo.git) 
- Docker Hub officiel :[ https://hub.docker.com/_/odoo ](https://hub.docker.com/_/odoo) 

**pgAdmin** quant à elle devra être utilisée pour administrer de façon graphique la base de données PostgreSQL. 

- Site officiel :[ https://www.pgadmin.org/ ](https://www.pgadmin.org/) 
- Docker Hub officiel:[ https://hub.docker.com/r/dpage/pgadmin4/ ](https://hub.docker.com/r/dpage/pgadmin4/) 

Le site web vitrine a été conçu par l’équipe de développeurs de l’entreprise et les fichiers relatifs se trouvent dans le repo suscité : [ https://github.com/eazytraining/projet-fils-rouge.git ](https://github.com/eazytraining/projet-fils-rouge.git) . Ici nous allons conteneuriser cette application tout en permettant la saisie des différentes URL des applications (Odoo et pgadmin) par le biais des variables d’environnement. 

Ci-dessous un aperçu du site vitrine attendu. 

![](images/site_vitrine.jpeg)

**NB :**L'image créée devra permettre de lancer un container permettant d’héberger ce site web et ayant les liens adéquats permettant d’accéder à nos applications internes 

## **2) Technos utilisées **

Pour ce projet, nous allons utiliser les technos suivant:

+ Physical host: Windows 11
+ Virtualbox 7.0
+ Centos Stream 9
+ Docker version 26.1.1 build 4cf5afa
+ Docker Compose version v2.7.0
+ Registre docker officiel sur le dépot dockerhub: registry version 2
+ Interface utilisateur du registre docker: joxit/docker-registry-ui depuis le registre public dockerhub

## **3) Conteneurisation de l’application web.** 

Il s’agit en effet d’une application web python utilisant le module Flask. Les étapes à suivre pour la conteneurisation de cette application sont les suivantes : 

1) Image de base : `python:3.6-alpine`
2) Définir le répertoire `/opt` comme répertoire de travail 
3) Installer le module Flask à l’aide de `pip install`
4) Exposer le port `8080` qui est celui utilisé par défaut par l'application
5) Créer les variables d’environnement `ODOO_URL` et `PGADMIN_URL` afin de permettre la définition de ces url lors du lancement du container 
6) Lancer l’application `app.py` dans le `ENTRYPOINT` grâce à la commande `python`  

Nous allons donc créer un fichier Dockerfile 

Une fois le Dockerfile créé,il faut Builder et lancer un container test permettant d’aller sur les sites web officiels de chacune de ces applications pour confirmer que l'image généré est bien fonctionnel. 

**Nom de l’image :**  ic-webapp
**tag :** 1.0.1
**container test_name :** test-ic-webapp

Une fois le test terminé, il faut supprimer ce container test et poussez l'image sur le registre Docker hub.

### ** Réalistation technique**

Pour commencer, nous allons:

  1. Nous allons cloner le répertoire du projet depuis github avec la commande : 
  
  `git clone https://github.com/eazytraining/projet-fils-rouge.git`

  2. Une fois cela terminée, nous allons éditer le fichier Dockerfile afin de construire l'image docker: 
  
  `vim Dockerfile`

  3. Le fichier Dockerfile étant terminé, nous allons procéder à la construction de l'image docker:

  ![docker build -t ic-webapp](https://github.com/rabinauget/filrouge/assets/61904489/84d7170e-28ff-4449-9126-f312b859866e)

  5. Vérifions que l'image a bien été créé:

![image](https://github.com/rabinauget/filrouge/assets/61904489/57070f77-b63a-4596-82fc-c82d35d584f3)

  7. Nous allons créer un container à partir de l'image nouvellement créé pour confirmer que l'image est bien fonctionnel:

![image](https://github.com/rabinauget/filrouge/assets/61904489/5d10708d-9f1b-4b6a-989c-527ef4422ff4)

  9. Etant donné que je suis sur une machine virtuelle sous virtualbox, nous allons devoir faire une redirection de port pour que depuis ma machine hôte, je puisse accéder au conteneur docker qui se trouve dans la machine virtuelle:

    a. ![image](https://github.com/rabinauget/filrouge/assets/61904489/0eef6a58-4119-4626-bea8-f2ab1760b596)

  11. Maintenant, nous allons pouvoir accéder au container sur le port 83:

  12. Etant donné que nous avons terminé le test et avons constaté que l'image est bien fonctionnel, nous allons pousser l'image vers le registre docker. Mais d'abord, il faut tagger l'image pour pouvoir le pousser. Et également, faire une redirection de port pour accéder à l'UI:

  13. Suppression du container:




