import UIKit

//1. Calcular el número de segundos que hay en un año y almacenarlos en una variable. Imprimir la variable
let dias = 365
let horas = 24
let segundos = 3600
let segundosTotales = dias * horas * segundos
print(segundosTotales)

//2. Calcular el número total de píxeles del iPhone 7 e imprimir el resultado en una frase
let altoIPhone7 = 1334
let anchoIPhone7 = 756
let pixeles = altoIPhone7 * anchoIPhone7
print("Tenemos un total de \(pixeles) pixeles")

//3. Imprimir el último dígito de este número
let num = 24378
print("El ultimo digito de \(num) es \(num % 10)")

//4. Calcular el precio con IVA (21%)
let precio = 10.95
let IVA = precio * 0.21
let precioFinal = precio + IVA
print(precioFinal)

//5. ¿Cuál es el número más grande?
let num1 = 5
let num2 = 7

if num1 > num2
{
    print("El nuemro \(num1) es mayor que \(num2)")
} else if num2 > num1
{
    print("El mumero \(num2) es mayor que \(num1)")
} else
{
    print("Ambos numeros son iguales")
}

//6. (Opcional) Desarrollar un programa que imprima todos los años bisiestos comprendidos entre estas dos fechas (ambas incluidas)
let anno1 = 1800
let anno2 = 2020

for i in anno1...anno2 where i % 4 == 0 || (i % 100 == 0 || i % 400 == 0)
{
    print(i)
}

//7. (Opcional) Crear un programa que imprima el número de ocurrencias de "o" en las siguientes palabras
let palabra1 = "cocodrilo"
let palabra2 = "lagarto"
var contp1 = 0
var contp2 = 0

for i in palabra1
{
    if i == "o"
    {
        contp1 += 1
    }
}

for i in palabra2
{
    if i == "o"
    {
        contp2 += 1
    }
}
print("En \(palabra1) encontramos \(contp1) en comun con el caracter \"o\"")
print("En \(palabra2) encontramos \(contp2) en comun con el caracter \"o\"")

//8. (Opcional) Imprimir las palabras de esta frase que contengan la letra "r", cada una en una línea
let frase = "El perro del roque no tiene rabo porque Ramón Ramírez se lo ha cortado."
let fraseArray = frase.components(separatedBy: " ")

for i in fraseArray where i.contains("r")
{
    print(i)
}
