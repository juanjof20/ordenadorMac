import UIKit

enum Dia
{
    case lunes, martes, miercoles, jueves, viernes
}
var hoy = Dia.jueves

enum Golpe
{
    case golpeLeve(Int)
    case golpeMedio(Int)
    case golpeFuerte(Int)
    case golpeMortal
}

class Arma
{
    var tipoGolpe:Golpe? ///?  indica que es opcional
}

let espada = Arma()

espada.tipoGolpe = .golpeFuerte(8)


class Personaje
{
    var vida = 100
    var fuerza = 100
}

let guerrero = Personaje()

switch espada.tipoGolpe! /// !  por que esta aqui???
{
    case .golpeLeve(let puntos):guerrero.vida -= puntos
    case .golpeMedio(let puntos)  where puntos <= 5:guerrero.vida -= puntos*2
    case .golpeMedio(let puntos)  where puntos > 5:guerrero.vida -= puntos*3
    case .golpeFuerte(let puntos):guerrero.vida -= puntos*3; guerrero.fuerza -= puntos
    case .golpeMortal:guerrero.vida = 0
default:()
}

guerrero.vida
guerrero.fuerza

enum DivisionError:Error
{
    case EntreCero
}

func division(op1: Float, op2: Float) throws -> Float
{
    if op2 == 0
    {
        throw DivisionError.EntreCero
    }
    return op1/op2
}

do
{
    var resultado: Float
    try resultado = division(op1: 3, op2: 3)
        print("Resultado: \(resultado)")
} catch DivisionError.EntreCero
{
    print("No se puede dividir por 0")
}


// Diccionarios
    var spanishEnglish = [String: String]()
    print(spanishEnglish.isEmpty)

    spanishEnglish["Hola"] = "Hello"
    spanishEnglish["Adios"] = "Bye"

    var numeros = [1: "uno", 2: "dos", 3: "tres", 4: "cuatro", 5: "cinco"]
    /// var numeros = [Int : String]()

    print(numeros.count)
    print(numeros[3]!)
    print(spanishEnglish["Adios"]!)

    var myDictionary:[Int: Double] = [:]
    /// var myDictionary = [Int: Double]()

    var myDictionary2 = Dictionary<Int, Double>()

    myDictionary = [4: 4.22, 6: 8.234, 5: 234, 24: 87.344]

    for (key, value) in myDictionary
    {
        print("La clave \(key) tiene el valor \(value)")
    }

    print(myDictionary[4]!)
    myDictionary[4] = 44
    print(myDictionary[4]!)

// ELIMINAR
    myDictionary[4] = nil
    for (key, value) in myDictionary
    {
        print("La clave \(key) tiene el valor \(value)")
    }

    let eliminado = myDictionary.removeValue(forKey: 5)
    for (key, value) in myDictionary
    {
        print("La clave \(key) tiene el valor \(value)")
    }

    var myKeys = Array(myDictionary.keys)
    var myValues = Array(myDictionary.values)
    for (key, value) in myDictionary
    {
        print("La clave \(key) tiene el valor \(value)")
    }
    print(myKeys)
    print(myValues)
