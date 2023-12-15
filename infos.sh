#!/bin/bash

# create ore use config file

config_file="config"

create_config(){
    read -p "What name should have the folder?" Ordnername
    read -p "Whats your Name? " cname
    read -p "What city do you live in? " cplace
    
    
    echo "
    name='$cname'
    Ort='$cplace'
    " > "$config_file"
}


[[ -f "$config_file" ]] || create_config


source $config_file


# Variablen
html=".html"
wetter=$(curl wttr.in/$Ort?format=3)
date=$(date +%d-%m-%Y" um "%H:%M)
utime=$(uptime)
text="$text1$date$text2$wetter$text3$utime"

# Infos datei erstellen und in den Ordner gehen
if [ ! -d "$Ordnername" ] 
then

mkdir $Ordnername
fi

cd $Ordnername

# Erstelle die HTML-Datei
echo -e "<!DOCTYPE html>
<html lang=\"de\">
<head>
    <meta charset=\"UTF-8\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
    <title class=\"title\">INFOS | Hjack</title>

    <!-- GOOGLE FONTS -->
    <link rel=\"preconnect" href="https://fonts.googleapis.com\">
<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>
<link href=\"https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@1,500&family=Roboto+Slab:wght@800&display=swap\" rel=\"stylesheet\">
    <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">
    <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>
    <link href=\"https://fonts.googleapis.com/css2?family=Ephesis&family=Ubuntu+Mono&family=Vina+Sans&display=swap\" rel=\"stylesheet\">
    <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">
    <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>
    <link href=\"https://fonts.googleapis.com/css2?family=Ubuntu+Mono&family=Vina+Sans&display=swap\" rel=\"stylesheet\">
    
    <style>
        body {
            background-color: #f0f0f0;
            color: #333;
            font-family: 'Ubuntu Mono', monospace;
            text-align: center;
            margin: 20px;
        }

        .title {
            color: #007bff;
        }

        .überschrift {
            margin: auto;
            width: 50%;
        }

        .box{
            max-widh: 8000px
            border: 10px solid #111;
            border-radius: 200px;
            padding: 1px;
            margin-top: 20px;
        }

        .datum {
            font-family: 'Ubuntu Mono', monospace;
            
        }

        .Name {
            font-family: 'Playfair Display', monospace;
        }

        .name2 {
            font-family: 'Roboto Slab', monospace;
        }

        h1 {
            font-family: 'Ephesis', sans-serif;
        }

        .wetter {
            color: #28a745;
        }

        .uptime {
            color: #dc3545;
        }
    </style>
</head>

<body>
    <div class=\"überschrift\">
        <h1>Infos vom $date</h1>
    </div>

    <div class=\"Name\">
        <h1>Hallo <span class="name2">$name</span></h1>
    </div>

    <div class="box">

    <div class=\"datum\">
        <h2>heute ist der $date.</h2>
        <h2 class=\"wetter\">Das Wetter sieht folgendermaßen aus: $wetter.</h2>
        <h2 class=\"uptime\">$systeminfo</h2>
    </div>

    </div>
    </div >

</body>
</html>" > "infos_$date.html"

# HTML Öffnen
open "infos_$date.html"