import { ref } from "vue";
import { defineStore } from "pinia"; 

export const useAdminStore = defineStore('admin', () => {
    const admin = ref({
        isLoggedIn: false,
    })

    const register = (newUser) => {
        admin.value.isLoggedIn = true
    }
    const signIn = () => {
        admin.value.isLoggedIn = true
    }
    const signOut = () => { 
        admin.value.isLoggedIn = false 
    }

    return {
        admin,
        register,
        signIn,
        signOut,
    }
})



 