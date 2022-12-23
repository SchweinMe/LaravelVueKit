<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Backoffice</title>

    @if(env('APP_DEBUG') === false)
        @foreach ($css as $val)
            <link rel="stylesheet" href="/build/{{$val}}" >   
        @endforeach
    @else
        @vite('resources/js/backoffice/scss/backoffice-app.scss') 
    @endif
   
</head>
<body>
   
    <div id="app" >Test</div>
    @if(env('APP_DEBUG') === false)
        <script src="{{$js}}"></script>
    @else
        @vite('resources/js/backoffice/backoffice-app.js') 
    @endif
</body>
</html>