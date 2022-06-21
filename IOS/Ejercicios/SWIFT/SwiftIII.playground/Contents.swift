import UIKit

//1. Que escriba los múltiplos de 7 entre 0 y 50.
    for x in 0...50 where x%7 == 0
    {
        print(x)
    }

//2. Que escriba las tablas de multiplicar del 0 al 10.
    for i in 0...10
    {
        print("Tabla del \(i)")
        for j in 1...10
        {
            print("\(i) x \(j) = \(i * j)")
        }
    }

//3. (Opcional) Que calcule la media de 10 números aleatorios.
    var randomInt = Int.random(in: 0...100)

//4. (Opcional) Que escriba los primeros 25 dígitos de la sucesión de Fibonacci.
    var fib: [Int] = []
    fib.append(1)
    fib.append(1)
    for i in 2..<25
    {
        fib.append(fib[i-1]+fib[i-2])
    }
    for i in 0..<25
    {
        print("\(fib[i])")
    }

//5. (Opcional) Imprime "Buscando el número X" siendo X un número aleatorio. A continuación imprime números aleatorios entre 1 y 20 hasta que coincida con X.
    var random = Int.random(in: 1...20)
    print("Buscando el numero \(random)")
    var random2 = 0
    repeat
    {
        random2 = Int.random(in: 1...20)
        print(random2)
    } while random2 != random

//6. Imprimir el número más pequeño
    let n1 = 5, n2 = 2, n3 = 1, n4 = 3
    var menor = 9999

    if n1 < menor
    {
        menor = n1
    }
    if n2 < menor
    {
        menor = n2
    }
    if n3 < menor
    {
        menor = n3
    }
    if n4 < menor
    {
        menor = n4
    }
print("El numero menor es \(menor)")

/*7. Escribir un switch que imprima:
"Aquí" si la distancia es 0
"Aquí al lado" si está a menos de 5
"Se puede ir andando" si está entre 5 y 30
"Lejos" si es menos de 60
"Muy lejos" más de 60
*/
    let distancia = 15
    switch distancia
    {
        case 0:
            print("Aquí")

        case _ where distancia < 5:
            print("Aquí al lado")
        
        case 5...30:
            print("Se puede ir andando")
            
        case _ where distancia < 60:
            print("Lejos")

        case _ where distancia > 60:
            print("Muy Lejos")

        default: print("No es un numero")
    }

//7. Crea un array de tipo char con un tamaño de 26 elementos. Rellena el array con los números del 65 al 90, ambos incluidos. Por último, imprime todos los elementos del array.
//Nota: Casting Int to Char -> Character(UnicodeScalar(i)!)
    var array7 = [Character](repeating: "a", count: 26)
    var index = 0;
    for i in 65...90
    {
        array7[index] = Character(UnicodeScalar(i)!)
        index += 1
    }
    print("Array 7: \(array7)")

//8. (Opcional) Crea dos arrays (A y B) de tamaño 5 y rellénalo con números. Después crea un tercero con el doble de tamaño cuyos valores serán: el 1º de A, el 1º de B, el 2º de A, el 2º de B, etc.
    let arrayA:[Int] = [1,2,3,4,5]
    let arrayB:[Int] = [6,7,8,9,10]
    var array8 = [Int](repeating: 0, count: 10)
    var count = 0
    for i in 0...4
    {
        array8[count] = arrayA[i]
        count += 1
        array8[count] = arrayB[i]
        count += 1
    }
    print("Array 8: \(array8)")

//9. Crea un array de dos dimensiones de tamaño 2x5 con los valores enteros que quieras. Crea un tercer array de tamaño 5 y rellénalo con la suma de los valores en la posición 0 del array bidimensional. Por ejemplo, tenemos un array de dos dimensiones {1,2,3,4,5},{5,4,3,2,1}, el tercer array debe ser la suma del array bidimensional: {1+5, 2+4, 3+3, 4+2, 5+1}
    var array9 = [[1,2,3,4,5],[5,4,3,2,1]]
    var array91 = [Int](repeating: 0, count: 5)

    for i in 0...4
    {
        array91[i] = array9[0][i] + array9[1][i]
    }
    print("Array 9: \(array91)")

//10. Crear un array bidimensional de 6x6 y complétalo con los números que tú quieras. Imprime el array y la suma de cada una de sus filas.
    var array10 = Array(repeating: Array(repeating: 0, count: 6), count: 6)
    print("Array 10: \(array10)")


//11. (Opcional) Crea un array con un tamaño de 10 posiciones y rellénalo con números aleatorios. Recorre el array para saber cuántos números pares tiene. Después, crea otro array y llénalo sólo con los números pares que tenía el array anterior.


//12. (Opcional) Crear un array bidimensional de 3x6 con los números que desees. Crea otro array de 6x3 y traspón el primero en el segundo. Es decir, si tenemos este de 2x3 {1, 3, 5} debería quedar {1, 2} {2, 4, 6} {3, 4} {5, 6}
