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

## Installation

### Prérequis

- Docker & Docker Compose installés sur votre machine.  
- Au moins 8 Go de RAM recommandés pour exécuter tous les services.

##Structure du projet

/project
│
├── docker-compose.yml

├── airflow/

│   ├── dags/
        └── data_warehouse_daily.py
        
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
