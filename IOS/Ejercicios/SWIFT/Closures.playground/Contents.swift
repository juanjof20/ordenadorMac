import UIKit

//func suma (param1: Int, param2: Int) -> Int()

// Al ser una func anonima no lleva nombre, por eso empieza {(...)}
//{ (param1: typeOne, param2: typeTwo) -> ReturnType in
//    // Implementacion del cuerpo de la funcion
//}


// SIN Closures
    func add42(_ numero: Int) -> Int
    {
        return numero + 42
    }
    add42(3)
// CON Closures
    let add42Closure =
    {(numero: Int) -> Int in
        return numero + 42
    }
    add42Closure(3)


// Closures como parametro de entrada
    func add10(_ numero:Int) -> Int
    {
        return numero + 10
    }

    let add10Clourse =
    {
        (numero: Int) -> Int in
        return numero + 10
    }

    func apply
        (
            _ funcion:(Int) -> Int,
            con numero: Int
        ) ->Int
                {
                    return funcion(numero)
                }
    apply(add42Closure, con: 3)
    apply(add10Clourse, con: 3)


// Closures como tipo de retorno de una funcion
    func adder(numero: Int) -> (Int) -> Int
    {
        func add(x: Int) -> Int
        {
            return x + numero
        }
        return add
    }
    let add42New = adder(numero: 42)
    let add10New = adder(numero: 10)
    add42New(3)
    add10New(19)

    let listaDeFunciones: [(Int) -> Int] = [add42Closure, add10Clourse, add42New]
    for funcion in listaDeFunciones
    {
        print(funcion (3))
    }

    let funcionesList =
        [
            add42Closure, // (Int) -> Int
            {
                (numero: Int) -> Int in return numero + 42
            }, // Sintaxis Explícita
            {
                (numero: Int) in return numero + 42
            }, // Omitimos el retorno "-> Int"
            {
                numero in return numero + 42
            }, // Omitimos el tipo de entrada y el retorno "(numero: Int) -> Int"
            {
                numero in numero + 42
            }, // Cuando el cuerpo de la funcion es solo una linea podemos omitir el return
            {
                $0 + 42
            }
        ]

    for funcion in funcionesList
    {
        print(funcion (3))
    }

    var sumar: (Int, Int) -> Int =
    {
        op1, op2 in op1 + op2
    }
    sumar(4,2)

    var numeros = [3, 6, 3, 7, 8]
    numeros.map(
        {
            (num: Int) -> Int in
            return num + 1
        })

    let resnum = numeros.sorted(by: { $0 < $1 })
    print(resnum)
    
    numeros.map { $0 * 2 }

    let arrayDePares = numeros.filter { $0 % 2 == 0 }
    print(arrayDePares)

    let sumaTotal = numeros.reduce(0) { (total, n) in total + n }
    print(sumaTotal)


