<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public function backOfficeIndex() {
        try {
            $data = ["css" => [], "js" => ""];
            if(!env('APP_DEBUG')) {
                $getFile = file_get_contents(public_path('build/manifest.json'));
                $manifest = json_decode( $getFile, true);
                $data['css'] = $manifest['resources/js/backoffice/backoffice-app.js']['css'];
                $data['js'] = $manifest['resources/js/backoffice/backoffice-app.js']['file'];
            }  
           
            return view("backoffice", $data);
        } catch (Exception $e) {
            abort(500);
        }
    }

}
