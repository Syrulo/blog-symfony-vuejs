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
          const response = await instance.get('http://localhost:8080/api/test');
          console.log('Réponse de l\'API :',response.data);  // Affiche le message de Symfony dans la console
        } catch (error) {
          console.error('Erreur CORS :', error);
        }
      }
    }
  }
  </script>
  
  <style scoped>
  /* Ajoute ici du style si nécessaire */
  </style>
  