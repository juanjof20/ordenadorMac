import UIKit

//8. Declarar array "palabras"
var palabras:[String] = []

//9. Guardar una palabra en cada posición del array
palabras = ["palabra1", "palabra2", "palabra3"]

//10. Declara una tupla llamada "alumno" para almacenar nombre, puesto(entero), ciclo y curso
var alumno:(nombre: String, puesto: Int, ciclo: String, curso: Int)

//11. y 12. Añade tu nombre y tu nº de puesto a la tupla
alumno.nombre = "Juanjo"
alumno.puesto = 1

//13. Asignar el curso y el ciclo
alumno.ciclo = "DAM"
alumno.curso = 2

//14. Imprime "Hola soy MiNombre, estoy en el puesto número X" utilizando los valores de la tupla
print("Hola soy \(alumno.nombre), estoy en el puesto número \(alumno.puesto) utilizando los valores de la tupla")

//15. Declara la tupla "coords" con 3 variables: x, y, z. Asignar los valores 20.0, 30.0 y 10.0, respectivamente.
let coords:(x:Double, y:Double, z:Double) = (20.0, 30.0, 10.0)

//16. Crear un array de tuplas con los datos de todos tus compañeros de clase
let compañeros:[(String, Int)] = [("Alfondo", 1),("Roberto", 2),("Jose Manuel", 3),("Juanjo", 4)]

//17. Imprime el nombre del alumno sentado en el puesto 3
print(compañeros[3].0)

//(Opcionales) Programa un switch que imprima:
//18. "Punto 0" cuando la coordenada sea 0,0,0
//19. El eje cuya coordenada sea 0 (X, Y, o Z)
//20. La palabra "Centro" cuando el valor de los 3 ejes sean iguales
switch (coords)
{
    case (0, 0, 0):
        print("Punto 0")

    case (0, _, _):
        print("Eje X = 0")

    case (_, 0, _):
        print("Eje Y = 0")

    case (_, _, 0):
        print("Eje Z = 0")
        
    case (coords.x, coords.y, coords.z):
        if(coords.x == coords.y && coords.x == coords.z)
        {
            print("Centro")
        }
 default: print("otra coordenada")
}

//21. Reemplazar el 5 por un 7 en este array: [6, 9, 3, 11, 5, 48]
var array = [6, 9, 3, 11, 5, 48]
array[4] = 7
print(array)

//22. En el array anterior, reemplazar los valores 9, 3 y 11 por 9, 10, 11, 13 y 7
array[1...3] = [9, 10, 11, 13, 7]
 
//23. Crea un array de números enteros con un tamaño de 10 elementos llamado arn
var arn: [Int] = [0,0,0,0,0,0,0,0,0,0]

//24. Asigna valor a las posiciones 1, 4, 9 y 10 de arn.
arn[0] = 1
arn[3] = 4
arn[8] = 9
arn[9] = 10

//25. Imprime los valores de las posiciones 4, 1, 9 y 10 de arn
print(arn[0])
print(arn[3])
print(arn[8])
print(arn[9])

//26. Imprime todos los elementos del array en una misma línea separados por comas o espacios. Razonar la respuesta y explica las dificultades encontradas.
var text = ""
for t in arn
{
    text += "\(t) "
}
print(text)

//27. Dado un array de números enteros con un tamaño de 5 posiciones con los siguientes valores {1,2,3,4,5}. Guardar los valores de este array en otro array pero con los valores invertidos, es decir, {5,4,3,2,1}.
var array27 = [1, 2, 3, 4, 5]
print(array27)
var arrayReversed: [Int] = array27.reversed()
print(arrayReversed)
