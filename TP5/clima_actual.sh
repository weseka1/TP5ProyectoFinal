#!/bin/bash

# Configuración de la API de WeatherAPI
API_KEY="23493061ec184c6d8d420917241207"
CIUDAD="Bahia Blanca"

CIUDAD_URL=$(echo "$CIUDAD" | sed 's/ /%20/g')

# Hacer la solicitud a la API
url="http://api.weatherapi.com/v1/current.json?key=$API_KEY&q=$CIUDAD_URL"
clima=$(curl -s "$url")

# Verificar si la solicitud fue exitosa
if [[ $(echo "$clima" | jq -r '.error.code') != "null" ]]; then
    echo "Error al obtener el clima:"
    echo $(echo "$clima" | jq -r '.error.message')
else
    # Extraer la descripción del clima y la temperatura
    descripcion=$(echo "$clima" | jq -r '.current.condition.text')
    temperatura=$(echo "$clima" | jq -r '.current.temp_c')

    # Mostrar la información obtenida
    echo "El clima actual en $CIUDAD es: $descripcion"
    echo "Temperatura actual: $temperatura °C"
fi
