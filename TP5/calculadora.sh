#!/bin/bash

# Función para realizar la suma
function suma {
    resultado=$(echo "scale=2; $1 + $2" | bc)
    echo "Suma: $1 + $2 = $resultado"
}

# Función para realizar la resta
function resta {
    resultado=$(echo "scale=2; $1 - $2" | bc)
    echo "Resta: $1 - $2 = $resultado"
}

# Función para realizar la multiplicación
function multiplicacion {
    resultado=$(echo "$1 * $2" | bc)
    echo "Multiplicación: $1 * $2 = $resultado"
}

# Función para realizar la división
function division {
    if [[ $2 -eq 0 ]]; then
        echo "Error: No se puede dividir por cero."
    else
        resultado=$(echo "scale=2; $1 / $2" | bc)
        echo "División: $1 / $2 = $resultado"
    fi
}

# Mensaje de bienvenida y solicitud de datos al usuario
echo "Calculadora Simple"
read -p "Ingresa el primer número: " num1
read -p "Ingresa el segundo número: " num2
echo "Selecciona la operación:"
echo "1. Suma"
echo "2. Resta"
echo "3. Multiplicación"
echo "4. División"
read -p "Opción (1-4): " opcion

# Evaluar la opción ingresada y llamar a la función correspondiente
case $opcion in
    1)
        suma $num1 $num2
        ;;
    2)
        resta $num1 $num2
        ;;
    3)
        multiplicacion $num1 $num2
        ;;
    4)
        division $num1 $num2
        ;;
    *)
        echo "Opción inválida."
        ;;
esac
