# Projet Blog Symfony + Vue.js + Docker

## 🚧 En cours de développement

Ce projet est encore en cours de développement. Certaines fonctionnalités ne sont pas encore ajoutées, finalisées ou testées. 

Ceci est mon premier projet **API-first** et également le premier projet où j’utilise un **multiframework (Vue.js + Symfony)** avec un environnement **Docker** pour gérer tous les services.
Ce projet me permet d'expérimenter avec différentes technologies et de m'améliorer dans la gestion des APIs, du front-end et du back-end de manière intégrée.

**Si vous souhaitez signaler un bug ou suggérer des améliorations, n'hésitez pas à ouvrir une issue.**

---

Un projet **API-first** utilisant **Symfony** pour l'API, un **front-end Vue.js** avec **Axios** pour les requêtes API, et un environnement Docker avec 4 conteneurs pour une configuration complète et reproductible.

## 💻 Stack

- **Symfony** (Backend) pour créer une API RESTful
- **Vue.js** (Frontend) + **Axios** pour consommer l'API
- **Docker** pour la gestion des conteneurs et la configuration de l'environnement
- **JWT Auth** pour l'authentification
- **MySQL** comme base de données
- **phpMyAdmin** pour gérer la base de données via une interface graphique
- **Apache** pour servir l'application Symfony

## ⚙️ Fonctionnalités à venir

### Backend (Symfony)
- Authentification via JWT avec gestion des rôles
- Gestion des utilisateurs et des permissions
- API REST documentée avec **Swagger UI**
  
### Frontend (Vue.js)
- Interface utilisateur responsive avec **Vue.js** et **Vue Router**
- Consommation de l'API via **Axios**

## 📦 Prérequis

Avant de démarrer, assurez-vous d'avoir les éléments suivants installés sur votre machine :

- **Docker** : Pour construire et lancer les conteneurs
- **Docker Compose** : Pour gérer les services multi-conteneurs

## 🚀 Installation et démarrage

### 1. Cloner le repository

Clonez ce projet dans votre répertoire local :

```bash
git clone https://github.com/ton-utilisateur/projet-symfony-vuejs.git
cd projet-symfony-vuejs
```

### 2. Démarrer les services

Utilisez Docker Compose pour démarrer tout les services :

```bash
docker-compose up --build
```

### 3. Accéder à l'application

Ouvrez votre navigateur et rendez-vous aux adresses suivantes pour accéder aux différents services :

- Backend Symfony (API) : http://localhost:8000 pour interagir avec l'API.
- Frontend Vue.js : http://localhost:5173 pour l'interface utilisateur Vue.js.
- phpMyAdmin : http://localhost:8080 pour gérer la base de données MySQL.

### 4. Développement local

Pour accéder au conteneur symfony, utilisez cette commande :

```bash
docker-compose exec symfony bash
```

Pour accéder au conteneur vue.js, utilisez cette commande :

```bash
docker-compose exec vuejs bash
```

### 5. Développement local

Pour accéder à la documentation interactive de l'api, accédez à l'url suivante : http://localhost:8000/api/doc
