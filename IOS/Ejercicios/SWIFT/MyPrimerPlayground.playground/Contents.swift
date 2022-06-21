import UIKit

var greeting = "Hello, playground"

// Comentario de linea

/*
    Comentario
    de
    bloque
*/

// Declaracion de Variables [var] y Constantes [let]
var nombreVariable = 1
let nombreConstante: String = "Esto es una constante"

// Declaracion de variable y constante sin necesidad de pasar el tipo de dato (ya que lleva el dato que va acontener)
var siete = 7
let otroTexto = "Esto es otro string"

// Si la variable o constante esta vacia debemos de poner obligatoriamente el tipo de dato
var numero: Int
let otroTextoNuevo: String

// CASTING
var decimal = 12.3
var decimal12: Float = Float(decimal)
decimal12 = Float(siete)
numero = Int(decimal)

// IMPRIMIR
print("hola")

// CONCATENAR   \(nombreVariable)
var nombre = "Pepe"
print("Hola \(nombre)")
print("Mi numero es ", numero, "(doce)")

// INCREMENTACION
numero += 3 // numero = numero + 3
numero -= 3 // numero = numero - 3
numero *= 3 // numero = numero * 3
numero /= 3 // numero = numero / 3

// CONDICIONALES
    // IF
    if numero > 2
    {
        print("Mayor que 2")
    } else if numero < 2
    {
        print("Menor que 2")
    } else
    {
        print("Numero es 2")
    }

    // SWITCH
    switch numero
    {
        case 1:
            print("Es uno")

        case 2, 5:
            print("Es dos o cinco")
        
        case 6...23: // Intervalos
            print("Esta entre 6 y 23")
        
        default: print("No es un numero")
    }

// BUCLES
    // FOR
    for i in  0...10
    {
        print(i)
    }

    for i in  0..<10
    {
        print(i)
    }

    for i in 0...10 where i % 2 == 0 && i != 8 // haciendo una excepcion para imprimir los pares y no imprimir el 8
    {
        print(i)
    }

    // WHILE si no se cumple no se ejecuta
    var j = 0
    while j <= 10
    {
        print(j)
        j += 1
    }

    // REPEAT (do...while) se ejecuta minimo 1 vez
    var h = 0
    var str = ""
    repeat
    {
        str = "\(str) \(h)"
        h += 1
    } while h < 10
    print(str)

var hola: String = "Hola"
// Para concatenar podemos hacerlo con el + pero hay que hacer cast porque el + solo es para String, es mejor usar \()
var texto = hola + " que tal " + String(numero)

// Contar caracteres de un String
texto.count
texto[texto.startIndex]

// Sacar primer caracter de un String
let indiceInicio = texto.startIndex
texto[indiceInicio]

// Comprobar si esta vacio
texto.isEmpty
let vacio: String = ""
vacio.isEmpty

// Comparar un String al principio Distingue entre mayusculas y minusculas
texto.hasPrefix("Hol")

// para saber si un String contiene un caracter especifico
texto.contains("H")

// Esto es para empezar no desde el inicio, sino desde index 6 y hasta el index 9
let inicio = texto.index(texto.startIndex, offsetBy: 5)
let fin = texto.index(texto.startIndex, offsetBy: 9)
let rango = inicio..<fin
texto[rango]

// Esto seria para separar un String mediante caracteres
let separado = texto.components(separatedBy: " ")
