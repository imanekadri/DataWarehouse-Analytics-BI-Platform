# Plateforme d’Analyse de Données avec PostgreSQL, Apache Airflow et Metabase

## Description

Ce projet vise à concevoir et déployer une plateforme complète d’analyse de données intégrant toutes les étapes du cycle décisionnel : collecte, transformation, stockage, analyse et visualisation des données.  
La solution repose sur des technologies open source et est entièrement conteneurisée avec Docker pour assurer la portabilité et la reproductibilité.

La plateforme combine :  
- **PostgreSQL** : Data Warehouse relationnel pour centraliser et structurer les données.  
- **Apache Airflow** : Orchestration et automatisation des pipelines ETL.  
- **Metabase** : Visualisation et analyse décisionnelle des données via des dashboards interactifs.

---

## Objectifs du projet

- Centraliser les données provenant de différentes sources dans un Data Warehouse.  
- Automatiser les processus ETL (Extract, Transform, Load) avec Airflow.  
- Permettre l’analyse et la visualisation des données en quasi-temps réel avec Metabase.  
- Créer des tableaux de bord interactifs et des rapports exploitables pour la prise de décision.

---

## Architecture du projet
                     Sources de données --> DAGs Airflow --> Data Warehouse (PostgreSQL) --> Dashboards Metabase

- **Sources de données** : fichiers CSV, bases de données externes ou autres flux de données.  
- **DAGs Airflow** : pipelines ETL planifiés pour extraire, transformer et charger les données.  
- **Data Warehouse PostgreSQL** : stockage structuré des données avec schéma en étoile (Star Schema).  
- **Metabase** : création de questions, graphiques et dashboards interactifs.

---

## Guide d’Installation

### Prérequis

- Avant de commencer, assurez-vous d’avoir installé sur votre machine :
- Docker (version récente)
- Docker Compose
- Minimum recommandé : 8 Go de RAM

### Cloner le repository
```bash
git clone https://github.com/imanekadri/DataWarehouse-Analytics-BI-Platform.git
cd DataWarehouse-Analytics-BI-Platform
```
### Configuration des conteneurs
Les services sont configurés via le fichier docker-compose.yml :

- PostgreSQL : base de données pour le Data Warehouse
- Apache Airflow : orchestration des pipelines ETL
- Metabase : visualisation et tableaux de bord
- Vous pouvez modifier les paramètres (ports, mots de passe, volumes) directement dans le fichier docker-compose.yml si nécessaire.

### Lancer la plateforme

Pour démarrer tous les services, exécutez :

docker-compose up -d


Cette commande va :

- Créer les conteneurs
- Démarrer PostgreSQL, Airflow et Metabase
- Monter les volumes pour persistance des données
- Vérifier le fonctionnement

  
1. PostgreSQL

     - Host : localhost ou adresse du conteneur

     - Port : 5432

     - Database : DataWarehouse

     - Username / Password : définis dans docker-compose

2. Apache Airflow

     - Accéder à l’interface : http://localhost:8080

     - Les DAGs principaux : data_warehouse_daily, data_warehouse_full_etl

     - Vous pouvez exécuter les DAGs manuellement ou attendre leur planification automatique.

3. Metabase

     - Accéder à l’interface : http://localhost:3000

     - Connecter la base PostgreSQL pour créer vos dashboards et questions.

     - Exécution des DAGs ETL

     - Aller dans l’interface Airflow

     - Activer le DAG souhaité

     - Cliquer sur "Trigger DAG" pour exécution immédiate

     - Vérifier que les données sont chargées dans le Data Warehouse

### Ressources utiles

- Documentation Docker : https://docs.docker.com/

- Documentation Airflow : https://airflow.apache.org/docs/

- Documentation Metabase : https://www.metabase.com/docs/latest/

💡 Astuce : Pour arrêter et supprimer les conteneurs :
```bash
docker-compose down
```
 

## Structure du projet


/project
│
├── docker-compose.yml

├── airflow/

│   ├── dags/

│       └── data_warehouse_daily.py
        
│       └── data_warehouse_full_etl.py

│   └── plugins/

├── sql-scripts/

│             └── create-airflow-db.sql

│             └── initial_database.sql
              
│             └── sample_data.sql
    
└── README.md


### Étapes

1. Cloner le repository :
```bash
git clone https://votre-repository.git
cd nom-du-repo
docker-compose up -d
