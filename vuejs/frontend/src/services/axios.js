import axios from 'axios';

axios.defaults.withCredentials = true;  // Autoriser les cookies et les credentials

// Crée une instance Axios pour configurer l'API
const instance = axios.create({
  baseURL: 'http://localhost:8080/api/', // L'URL de l'API Symfony
  headers: {
    'Content-Type': 'application/json',
  }
});

// Si un JWT est présent dans localStorage, l'ajouter dans les en-têtes Authorization
const token = localStorage.getItem('jwt_token');
if (token) {
  instance.defaults.headers['Authorization'] = `Bearer ${token}`;
}

// Ajouter un interceptor pour les réponses afin de gérer les erreurs (par exemple, erreur 401 si le token est invalide)
instance.interceptors.response.use(
  response => response,
  error => {
    // Ici tu peux gérer les erreurs (redirection vers login, notification, etc.)
    if (error.response && error.response.status === 401) {
      // Si l'API renvoie un 401, ça signifie que l'utilisateur n'est pas authentifié
      // Par exemple, tu pourrais rediriger l'utilisateur vers la page de login
      console.error('Token expiré ou invalide, redirige vers la page de login');
    }
    return Promise.reject(error);
  }
);

export default instance;
