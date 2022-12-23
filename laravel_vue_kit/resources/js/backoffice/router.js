import { createRouter, createWebHistory } from "vue-router";
import {useAdminStore} from './stores/Admin.js'; 

import MasterLayout from "./layouts/MasterLayout.vue";
import GuestLayout from "./layouts/GuestLayout.vue";
import AdminLayout from "./layouts/AdminLayout.vue";

import NotFound from "./pages/NotFound.vue";
import login from "./pages/Login.vue";
import register from "./pages/Register.vue";
import dashboard from "./pages/template/Dashboard.vue";

const routes = [
    {
        path: '/backoffice',
        component: MasterLayout,
        children: [
            {
                path: '/backoffice',
                component: AdminLayout, 
                meta: { requiresAuth: true },
                children: [
                    { path: "/backoffice", redirect: {name: 'dashboard' } },
                    { path: "dashboard", name: "dashboard", component: dashboard },
                ],
            },
            {
                path: '/backoffice',    
                component: GuestLayout, 
                children: [
                    { path: "login", name: "login", component: login },
                    { path: "register", name: "register", component: register },
                ]
            },
            {
                path: '/:catchAll(.*)*',
                name: "404", 
                component: NotFound
            }
        ]
    }
];

const router = createRouter({ 
    history: createWebHistory(), 
    routes,
    linkExactActiveClass: 'active'
});

router.beforeEach((to, from, next)=> {
    /* ถ้าไม่ได้ต้องการ login  */
    if(!to.meta.requiresAuth){
      next();
      return;
    } 

    /* เช็ค Login  */
    const store = useAdminStore();
    if(store.admin.isLoggedIn) {
      next();
      return;
    } else {
      next({ name: "login" });
      return;
    }
})

export default router;
