// src/router/index.js
import { createRouter, createWebHistory } from 'vue-router';
import DownloadComponent from '../components/DownloadComponent.vue';
import HistoryMore from '../components/HistoryMore.vue';

const routes = [
  { path: '/', component: DownloadComponent },
  { path: '/history-more', component: HistoryMore }
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;