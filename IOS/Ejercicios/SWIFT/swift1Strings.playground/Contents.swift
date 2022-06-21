import UIKit

//1. Declara el String nombre y el entero puesto
var nombre: String
var puesto: Int

//2. Asigna valores a puesto y nombre
nombre = "Juanjo"
puesto = 1

//3. Imprime "Hola soy MiNombre, estoy en el puesto número X" utilizando los valores de las variables anteriores
let frase: String = "Hola soy \(nombre), estoy en el puesto numero \(puesto)"; print(frase)

//4. Imprime el número de caracteres de la frase anterior
frase.count

//5. Imprime la primera letra
print(frase[frase.startIndex])

//6. Imprime la primera letra de otra forma
let inicio = frase.index(frase.startIndex, offsetBy: 0)
let final = frase.index(frase.startIndex, offsetBy: 1)
let rango = inicio..<final
frase[rango]

//7. ¿Contiene la letra a?
frase.contains("a")

//8. Crea un substring con el nombre e imprímelo
let ini = frase.index(frase.startIndex, offsetBy: 9)
let fin = frase.index(frase.startIndex, offsetBy: 14)
let rang = ini...fin
print(frase[rang])

//9. Crea un substring con "puesto número X" e imprímelo
let ini2 = frase.index(frase.endIndex, offsetBy: -15)
let fin2 = frase.index(frase.endIndex, offsetBy: 0)
let rang2 = ini2..<fin2
print(frase[rang2])
