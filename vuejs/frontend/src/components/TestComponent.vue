<template>
    <div>
      <h1>Test API Communication</h1>
    </div>
  </template>
  
  <script>
  import instance from '../services/axios';
  
  export default {
    name: 'TestComponent',
    mounted() {
      this.getData();
    },
    methods: {
      async getData() {
  try {
    const response = await instance.get('test'); // On utilise maintenant l'URL relative
    console.log('Réponse de l\'API :', response.data);
  } catch (error) {
    if (error.response) {
      console.error('Erreur dans la réponse de l\'API:', error.response);
    } else if (error.request) {
      console.error('Aucune réponse reçue du serveur:', error.request);
    } else {
      console.error('Erreur lors de la configuration de la requête:', error.message);
    }
  }
}
    }
  }
  </script>
  
  <style scoped>
  /* Ajoute ici du style si nécessaire */
  </style>
  