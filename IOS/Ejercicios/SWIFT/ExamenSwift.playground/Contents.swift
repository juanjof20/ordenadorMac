import UIKit

//1. Imprimir en consola los números del 1 al 50 usando un bucle for, indicando junto a cada uno de ellos si es múltiplo de 3 (10 ptos)
for i in 1...50
{
    if (i % 3 == 0)
    {
        print("El numero \(i) es mulriplo de 3")
    } else
    {
        print("El numero \(i) NO es mulriplo de 3")
    }
}

//2. Mostrar los números divisibles entre 7 y 3 que estén entre el 100 y el 200, usando un bucle for in  (5 ptos)
for i in 100...200 where (i % 7 == 0 && i % 3 == 0)
{
    print(i)
}

//3. Utilizando un bucle, mostrar del 15 al 5 descendiendo, ambos incluidos (5 ptos)

//4. Escribir un programa en swift que cree un array de 100 posiciones con números enteros aleatorios entre 0 y 10. Imprimir cuántas veces aparece el 3 y cuántas el 5 (10 ptos)
var array4: [Int] = []
var randomInt = Int.random(in: 0...10)
for i in 1...10
{
   array4.append(i)
}

//5. Imprimir el número de enteros que hay en este array (5 ptos)
let arrany:[Any] = [4,6,4.7,245,6.7,34,7.2,3,42,775,54.6,"Juan",32.0,124]
var count = 0
for arrany in arrany
{
    if arrany is Int
    {
        count += 1
    }
}
print("Encontramos \(count) Int en el array")

//6. Separar el array arrany en 3 arrays: uno de enteros, otro de doubles y otro de strings. Imprimir los 3 arrays después de crearlos. (10 ptos)


//7. Duplicar el primer y último caracter de este string. Almacenar el resultado en una variable e imprimirlo en pantalla. (5 ptos)
let fraseHola = "¡Hola EsTech!"
let first: String.Index = fraseHola.index(fraseHola.startIndex, offsetBy: 1)
let last = fraseHola.suffix(1)
var result: String = fraseHola.substring(to: first)
var total = last + result

//8. Crear una función que imprima en consola la primera mitad de un string (utilizar fraseHola como ejemplo para llamar a la función) (5 ptos)
func mitad(str: String) -> String
{
    let caracteres: Int = fraseHola.count
    let mitad: Int = caracteres/2
    let new:String
    for new in 0...mitad
    {
        print(new)
    }
    return
}
var frasemodi: String = mitad(str: fraseHola)

//9. Crear un string a partir de fraseHola donde se han movido los 2 primeros caracteres al final del string. (5 ptos)
let index: String.Index = fraseHola.index(fraseHola.startIndex, offsetBy: 2)
var result: String = fraseHola.substring(to: index)



//10. Crear una función que cuente cuántas veces aparece la letra “a” en una frase y lo devuelva como Int. Usar la función pasando como parámetro fraseHola e imprimir el resultado (10 ptos)
func c (fraseHola :String) -> Int
{
    var cont = 0
    for i in 0...fraseHola.count
    {
        if (fraseHola.contains("a")
        {
            cont += 1
        }
    }
}
print("Se hauya \(cont) vez")
return cont

//11. Crear una enumeración llamada Mano con tres elementos: piedra, papel, tijera. (5 ptos)
enum Mano: String
{
    case piedra = "piedra"
    case papel = "papel"
    case tijera = "tijera"
}

//12. Crear dos variables llamadas jugador1 y jugador2. Asignar una mano a cada uno de ellos. (5 ptos)
class Jugador
{
    var mano: Mano?
}

let jugador1 = Jugador()
let jugador2 = Jugador()
jugador1.mano = .papel
jugador2.mano = .piedra


//13. Utilizando condicionales, imprimir en consola las dos manos y el nombre del jugador que gana la partida. (20 ptos)

