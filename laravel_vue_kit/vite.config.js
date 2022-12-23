import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';
import vue from '@vitejs/plugin-vue'; 

export default defineConfig({
    plugins: [
        vue(),
        laravel({
            input: [
                'resources/js/backoffice/backoffice-app.js',
                'resources/js/backoffice/scss/backoffice-app.scss', 
            ],
            refresh: true,
        }),
    ],
});
