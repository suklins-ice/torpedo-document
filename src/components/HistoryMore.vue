<template>
  <div class="container-fluid">
    <h1 class="text-center text-white">History More</h1>
    <div class="list-group">
      <div class="history-section">
        <h2 class="text-white">iOS History</h2>
        <ul class="text-white">
          <li v-for="(item, index) in config.ios.history" :key="index">{{ item }}</li>
        </ul>
      </div>
      
      <div class="history-section">
        <h2 class="text-white">Android History</h2>
        <ul class="text-white">
          <li v-for="(item, index) in config.android.history" :key="index">{{ item }}</li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'HistoryMore',
  data() {
    return {
      config: {}
    };
  },
  created() {
    this.loadConfig();
  },
  methods: {
    async loadConfig() {
      try {
        const response = await axios.get('/download-config.json');
        this.config = response.data;
      } catch (error) {
        console.error('Error loading config:', error);
      }
    }
  }
};
</script>

<style scoped>
.container-fluid {
  background-color: #2e8b57; /* สีเขียว */
  padding: 20px;
  border-radius: 10px;
  width: 100%;
  height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  box-sizing: border-box;
}
.history-section {
  margin-bottom: 20px;
}
.text-white {
  color: white;
}
</style>