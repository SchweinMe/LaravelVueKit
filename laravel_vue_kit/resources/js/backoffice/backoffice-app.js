import '../bootstrap';
import { createApp } from 'vue';
import { createPinia } from "pinia";

import App from './Index.vue';
import router from './router.js';
import VeeValidatePlugin from "./includes/validation";
import i18n from "./includes/i18n";

import './scss/backoffice-app.scss'; 

const app = createApp(App);
app.use(createPinia());
app.use(router);
app.use(VeeValidatePlugin);
app.use(i18n);
app.mount("#app");
