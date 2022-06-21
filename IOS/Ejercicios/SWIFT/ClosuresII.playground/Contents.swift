import UIKit

// Utilizando el metodo filter, obtener todos los nombres de personas que se encuentran en e array y comienzan por A Á
let nombres = ["Ana","Juan","Pepe","Anastasio","Ángel"]

let nombresConA = nombres.filter { $0.first == "A" || $0.first == "Á" || $0.first == "a" || $0.first == "á" }
print("Los siguientes nombres comienzan por 'A': \(nombresConA)")

// Obtener la suma de los elementos del array
let numeros = [1, 2, 3, 4, 6, 7, 8, 33, 54]
let suma = numeros.reduce(0, {$0 + $1})
print("Los numeros array suman \(suma)")

// Con el metodo map, calcular el numero que se obtiene al dividir el numerador entre el denominador de diversas fracciones que se encuentran en el array de tuplas
let fracciones = [(1,2), (2, 3), (5, 1), (4, 7)]
let reales = fracciones.map {Double($0.0) / Double($0.1)}
print("Numeros reales obtenidos de las fracciones: \(reales)")

// Utilizando el metodo sorted, ordena ascendentemente todos los enteros de un array
let numeros2 = [3, 6, 2, 45, 76, 33, 9, 3, 56, 1]
let numerosOrdenados = numeros2.sorted(by: <)
print("Numeros ordenados: \(numerosOrdenados)")

// Definir la clase libro que tenga dos propiedades: titulo y pagina. A continuacion, crear un array de libros con diferentes titulos y paginas, y ordenar los libros por el titulo de manera ascendente.
class Libro
{
    var titulo = ""
    var paginas = 0
    init(_ titulo:String, _ paginas:Int)
    {
        self.titulo = titulo
        self.paginas = paginas
    }
}

var libros = [Libro("Juego de tronos", 250), Libro("Harry Potter", 1000), Libro("El Principito", 30), Libro("Blancanieves", 100)]
var librosOrdenados = libros.sorted(by: {$0.titulo < $1.titulo})
print("Los libros ordenados por titulo son: ")

func imprimeArrayDeLibros(arr:[Libro])
{
    for libro in arr
    {
        print(libro.titulo)
    }
}
imprimeArrayDeLibros(arr: librosOrdenados)

//RELACIÓN DE EJERCICIOS: (5 son opcionales)
//1. Utiliza el método filter para crear un array llamado múltiplos que contenga todos los múltiplos de 3 de un array de enteros que se llame numeros e imprímelo para comprobar el resultado:
///Con SWIFT5:  isMultiple(of:value))
///let numeros = [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
///for numero in numeros
///{
///    if numero.isMultiple(of: 3)
///    {
///        print("\(numero) es múltiplo de 3")
///    }
///}
let numeros1 = [1, 2, 3, 4, 6, 7, 8, 339, 54]
var multiplo = numeros1.filter({ $0 % 3 == 0 })
print("Son multiplo de 3: \(multiplo)")

//2. Utilizando el método reduce, encuentra el número más grande de entre los enteros de un array que se llame numeros1 e imprímelo:
let masGrande = numeros1.reduce(0, {max($0, $1)})
print("El numero mas grande del array es: \(masGrande)")

//3. Utilizando el método reduce, une todas las cadenas de un array en una sola añadiendo espacios entre cada una de ellas, e imprime el resultado:

//4. Utilizando el método filter sobre un array que contiene los nombres de varias personas, muestra sólo aquellos cuyo nombre tiene más de 5 letras:

//5. Utilizando el método reduce, calcula la suma de todos los enteros de un array, y a continuación calcula la media e imprime el resultado:

//6. Utilizando el método map convierte a minúsculas todas las cadenas almacenadas en un array, e imprime el resultado:
let array6 = ["HoplaJoa","dadadADada"]
let minus = minus.map(array6 =>
{
    return array6[0].toUpperCase() + palabra.slice(1);
})

//7. Utilizando el método map obtén un array con el número de letras que tienen cada una de las cadenas de otro array, e imprime el resultado:

//8. Utilizando el método sorted, ordena descendentemente todos los enteros de un array:

//9. Utilizando el método sorted, ordena ascendentemente todos los nombres de personas que se encuentran almacenados en un array:

//10. Utilizando el código de ejercicios anteriores, crear un array de libros con diferentes autores, títulos y páginas, y ordenar los libros por el número de páginas de manera ascendente y descendente utilizando el método sorted, mostrando finalmente el resultado:
