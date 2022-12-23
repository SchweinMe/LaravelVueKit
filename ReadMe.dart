#COURSE DETAILS {
    Instructor: "SchweinMe" 
    Name: "How Installation Laravel 9 + Vue 3 + TailwindCss + Vite" 
    Date: "22-12-2022"
}

#Installation /* ติดตั้ง */
    composer create-project laravel/laravel project-name;
    npm install;
    npm i vite laravel-vite-plugin --save-dev;
    npm i @vitejs/plugin-vue;
    npm i vue@next vue-loader@next;
    npm i vue-router@next;
    npm i sass;
    npm i -D tailwindcss postcss autoprefixer;
    npx tailwindcss init -p;
    npm install vee-validate;
    npm install @vee-validate/rules;
    npm install pinia;
    npm install vue-i18n@9;

    @package /* แพ็คเกจที่ได้เมื่อติดตั้งครบแล้ว */
    ['package.json'] {
        "private": true,
        "scripts": {
            "dev": "vite",
            "build": "vite build"
        },
        "devDependencies": {
            "autoprefixer": "^10.4.13",
            "axios": "^1.1.2",
            "laravel-vite-plugin": "^0.7.3",
            "lodash": "^4.17.19",
            "postcss": "^8.4.20",
            "tailwindcss": "^3.2.4",
            "vite": "^4.0.3"
        },
        "dependencies": {
            "@vee-validate/rules": "^4.7.3",
            "@vitejs/plugin-vue": "^4.0.0",
            "pinia": "^2.0.28",
            "sass": "^1.57.1",
            "vee-validate": "^4.7.3",
            "vue": "^3.2.36",
            "vue-i18n": "^9.2.2",
            "vue-loader": "^17.0.1",
            "vue-router": "^4.0.13"
        }
    }
    @endPackage

#Files Structure /* โครงสำหรับ Vue */
    ['resources/js/backoffice'] { 
        ['includes'] {
            @File 'i18n.js'
            @File 'validation.js'
        }
        ['layouts'] {
            @File 'AdminLayout.vue'
            @File 'GuestLayout.vue'
            @File 'MasterLayout.vue'
        }
        ['locales'] {
            @File 'en.json'
            @File 'th.json'
        }
        ['pages'] {
            ['template'] {
                @File 'Dashboard.vue'
            }
            @File 'Login.vue'
            @File 'Register.vue'
            @File 'NotFound.vue'
        }
        ['components'] {
            @File 'ButtonComponent.vue'
            @File 'InputComponent.vue'
        }
        ['scss'] {
            @File 'backoffice-app.scss'
        }
        ['stores'] {
            @File 'Admin.js'
        }
        @File 'backoffice-app.js'
        @File 'router.js'
        @File 'index.vue'
    }
    ['resources/views'] {
        @File 'backoffice.blade.php'
    }

#Config Project
    ['vite.config.js'] {
        - import vue from '@vitejs/plugin-vue'; 
        - plugins: [
            vue(),
            laravel({
                input: [
                    'resources/js/backoffice/backoffice-app.js',
                    'resources/js/backoffice/scss/backoffice-app.scss', 
                ],
                refresh: true,
            }),
        ]
    }
    ['tailwind.config.js'] {
        - content: [
            './public/**/*.html',
            './src/**/*.{js,jsx,ts,tsx,vue}',
        ]
        - theme: {
            screens: {
                'xs': {'min': '380px'},
                'sm': {'min': '500px'},
                'md': {'min': '768px'},
                'lg': {'min': '992px'},
                'xl': {'min': '1280px'},
                '2xl': {'min': '1440px'},
                '3xl': {'min': '1600px'},
                'max-xs': {'max': '379px'},
                'max-sm': {'max': '499px'},
                'max-md': {'max': '767px'},
                'max-lg': {'max': '991px'},
                'max-xl': {'max': '1279px'},
                'max-2xl': {'max': '1439px'},
                'max-3xl': {'max': '1599px'},
            }
        }
    }
    ['routes/web.php'] {
        namespace App\Http\Controllers;
        Route::prefix('backoffice')->group(function () {
            Route::get('/', [Controller::class, 'backOfficeIndex']);
            Route::get('/{any}', [Controller::class, 'backOfficeIndex'])->where('any', '.*');
        });
    }
    ['app/Http/Controllers/Controller.php'] {
        public function backOfficeIndex() {
            try {
                $getFile = file_get_contents(public_path('build/manifest.json'));
                $manifest = json_decode( $getFile, true);
                return view("backoffice", [
                    "css" => $manifest['resources/js/backoffice/backoffice-app.js']['css'],
                    "js" =>  "/build/" . $manifest['resources/js/backoffice/backoffice-app.js']['file'],
                ]);
            } catch (Exception $e) {
                abort(500);
            }
        }
    }
    ['resources/views/backoffice.blade.php'] {
        <head>
            @if(env('APP_DEBUG') === false)
                @foreach ($css as $val)
                    <link rel="stylesheet" href="/build/{{$val}}" >   
                @endforeach
            @else
                @vite('resources/js/backoffice/scss/backoffice-app.scss') 
            @endif
        </head>
        <body>
            <div id="app" ></div>
            @if(env('APP_DEBUG') === false)
                <script src="{{$js}}"></script>
            @else
                @vite('resources/js/backoffice/backoffice-app.js') 
            @endif
        </body>
    }
 










