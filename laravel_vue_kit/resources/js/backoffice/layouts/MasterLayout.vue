<script setup>
import { useAdminStore } from '../stores/Admin';
import { useRouter } from 'vue-router';
import i18n from '../includes/i18n';

const store = useAdminStore()
const router = useRouter()

const handlerSignIn = () => {
    store.signIn();
    router.push({name: 'dashboard'})
}
const handlerSignOut = () => {
    store.signOut(); 
    router.push({name: 'login'})
}
const switchLanguage = () => {
    i18n.global.locale  = i18n.global.locale === "th"?"en":"th";
    console.log(i18n.global)
}

</script>

<template>
    <h1>Master Template | {{ $n(100, "currency", "ja") }} - {{ $t("home.listen") }} </h1>
    <div>
        <button class="btn" @click.prevent="switchLanguage">Switch Language</button>
        - {{$i18n.locale.toUpperCase()}}
    </div>
    <ul>
        <li class="mb"><a href="/backoffice">Backoffice Page </a></li>
        <li><router-link :to="{name: 'dashboard'}">Dashboard Page</router-link></li>
        <li><router-link :to="{name: 'login'}">Login Page</router-link></li>
        <li><router-link :to="{name: 'register'}">Register Page</router-link></li>
    </ul>
    <div>
        <p v-if="store.admin.isLoggedIn">I'm Logged In <button class="btn" @click.prevent="handlerSignOut">Log Out</button></p>
        <p v-else><button class="btn" @click.prevent="handlerSignIn">Log In</button></p>
    </div>
    <router-view></router-view>
</template>