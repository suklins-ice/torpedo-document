<template>
  <div class="container-fluid" v-if="config.ios && config.android">
    <h1 class="text-center text-white text-bolder">eKYC Downloader</h1>
    <div class="list-group">
      <div class="download-section">
        <h2 class="text-white">Download iOS</h2>
        <img src="../assets/icons8-ios-logo-50.png" alt="iOS Icon" class="icon">
        <h3 class="text-white">SDK</h3>
        <ul class="text-white">
          <li v-if="latestIosSdk">
            <a :href="latestIosSdk.link" class="list-group-item list-group-item-action">Version {{ latestIosSdk.version }}</a>
          </li>
        </ul>
        <h3 class="text-white">APK</h3>
        <ul class="text-white">
          <li v-if="latestIosApk">
            <a :href="latestIosApk.link" class="list-group-item list-group-item-action">Version {{ latestIosApk.version }}</a>
          </li>
        </ul>
        
        <h3 class="text-white">Details</h3>
        <ul class="text-white">
          <li v-for="(item, index) in config.ios.history.slice(0, 3)" :key="index" v-html="item.replace(/\\n/g, '<br>')"></li>
        </ul>
        <router-link v-if="config.ios.history.length > 3" to="/history-more" class="btn btn-light mt-2">More</router-link>
      </div>
      
      <div class="download-section">
        <h2 class="text-white">Download Android</h2>
        <img src="../assets/icons8-android-os-50.png" alt="Android Icon" class="icon">
        <h3 class="text-white">SDK</h3>
        <ul class="text-white">
          <li v-if="latestAndroidSdk">
            <a :href="latestAndroidSdk.link" class="list-group-item list-group-item-action">Version {{ latestAndroidSdk.version }}</a>
          </li>
        </ul>
        <h3 class="text-white">APK</h3>
        <ul class="text-white">
          <li v-if="latestAndroidApk">
            <a :href="latestAndroidApk.link" class="list-group-item list-group-item-action">Version {{ latestAndroidApk.version }}</a>
          </li>
        </ul>
        
        <h3 class="text-white">Details</h3>
        <ul class="text-white">
          <li v-for="(item, index) in config.android.history.slice(0, 3)" :key="index" v-html="item.replace(/\\n/g, '<br>')"></li>
        </ul>
        <router-link v-if="config.android.history.length > 3" to="/history-more" class="btn btn-light mt-2">More</router-link>
      </div>
    </div>
  </div>
  <div v-else class="text-center text-white">
    Loading...
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'DownloadComponent',
  data() {
    return {
      config: {}
    };
  },
  created() {
    this.loadConfig();
  },
  computed: {
    latestIosSdk() {
      return this.config.ios.sdk[this.config.ios.sdk.length - 1];
    },
    latestIosApk() {
      return this.config.ios.apk[this.config.ios.apk.length - 1];
    },
    latestAndroidSdk() {
      return this.config.android.sdk[this.config.android.sdk.length - 1];
    },
    latestAndroidApk() {
      return this.config.android.apk[this.config.android.apk.length - 1];
    }
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
html, body {
  height: 100%;
  margin: 0;
}
#app {
  height: 100%;
}
.container-fluid {
  background-color: #2e8b57; /* สีเขียว */
  padding: 20px;
  border-radius: 10px;
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  box-sizing: border-box;
}
.download-section {
  margin-bottom: 20px;
}
.icon {
  width: 50px;
  height: 50px;
  margin-bottom: 10px;
}
.list-group-item {
  background-color: #333; /* สีดำ */
  color: white;
}
.text-white {
  color: white;
}
</style>