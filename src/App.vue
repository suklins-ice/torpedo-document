<template>
  <div id="app">
    <DownloadComponent />
  </div>
</template>

<script>
import DownloadComponent from './components/DownloadComponent.vue';

export default {
  name: 'App',
  components: {
    DownloadComponent
  }
};
</script>

<style>
@import 'bootstrap/dist/css/bootstrap.css';
html, body {
  height: 100%;
  margin: 0;
}
#app {
  height: 100%;
}
</style>