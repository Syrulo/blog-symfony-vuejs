# Utilise l'image officielle de Node.js LTS
FROM node:lts

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de votre projet dans le conteneur
COPY frontend/package.json frontend/package-lock.json ./

# Installer les dépendances
RUN npm install

# Copier le reste du projet dans le conteneur
COPY frontend/. .

# Exposer le port sur lequel Vite fonctionne
EXPOSE 5173

# Démarrer le serveur de développement
CMD ["npm", "run", "dev"]

