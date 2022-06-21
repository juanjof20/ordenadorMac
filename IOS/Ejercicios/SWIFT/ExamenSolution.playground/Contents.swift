import UIKit

for i in 1...50
{
    if i % 3 == 0
    {
        print("\(i) es  multiplo de 3")
    } else
    {
        print("\(i) NO es  multiplo de 3")
    }
}//1

for i in 100...200 where i % 3 == 0 && i % 7 == 0
{
    print(i)
}//2

for i in stride(from: 15, to: 5, by: -1)
{
    print(i)
}

var n = 15
repeat
{
    print(n)
    n -= 1
} while n >= 5//3

var arr4 = [Int]()
var tres = 0
var cinco = 0
for i in 0...99
{
    arr4.append(Int.random(in: 0...10))
    if arr4[i] == 3
    {
        tres += 1
    }
    if arr4[i] == 5
    {
        cinco += 1
    }
}
print(arr4)
print(tres)
print(cinco)//4

let arrany:[Any] = [4,5,6,7,8,9.9,"dios", 22]
var enteros = 0

for elemento in arrany
{
    if elemento is Int
    {
        enteros += 1
    }
}
print("El array tiene \(enteros) enteros")//5

var arrInt = [Int]()
var arrDouble = [Double]()
var arrString = [String]()

for e in arrany
{
    if e is Int
    {
        arrInt.append(e as! Int)// ! para obligar que sea un valor de tipo Int en este caso
    } else if e is Double
    {
        arrDouble.append(e as! Double)
    } else if e is String
    {
        arrString.append(e as! String)
    }
}//6

let fraseHola = "¡Hola*EsTech!"
let string7 = "\(fraseHola.first ?? " ")\(fraseHola)\(fraseHola.last ?? " ")" ///las cosas por defecto son para que al imprimir no muestre el optional
print(string7)//7

func mitad(cadena: String)
{
    let cont = cadena.count / 2
    let mitad = cadena.prefix(cont)
    print(mitad)
}
mitad(cadena: fraseHola)//8

let inicio = fraseHola.startIndex
let fin = fraseHola.index(fraseHola.startIndex, offsetBy: 2)
let rango = inicio..<fin
let sDupli = fraseHola[rango]

let inicio2 = fin
let fin2 = fraseHola.endIndex
let rango2 = inicio2..<fin2
let sDupli2 = fraseHola[rango2]

let ej9 = sDupli2 + sDupli
print(ej9)//9

var frase9 = fraseHola
for _ in 0...1
{
    frase9.append(frase9.removeFirst())
}
print(frase9)//otro 9

func cuentas(cadena: String) -> Int
{
    var aes = 0
    for i in cadena where i == "a" || i == "A" || i == "á" || i == "Á"
    {
        aes += 1
    }
    return aes
}
print(cuentas(cadena: fraseHola))//10

func cuentas2(cadena: String) -> Int
{
    var aes = 0
    for j in cadena
    {
        if j == "a" || j == "A" || j == "á" || j == "Á"
        {
            aes += 1
        }
    }
    return aes
}
print(cuentas2(cadena: fraseHola))//otro 10

enum Mano
{
    case piedra, papel, tijera
}//11

var jugador1 = Mano.tijera
var jugador2 = Mano.papel//12

let juego = (jugador1, jugador2)
if jugador1 == Mano.piedra && jugador2 == Mano.tijera
{
    print("Gana Jugador 1")
} else if jugador1 == Mano.tijera && jugador2 == Mano.papel
{
    print("Gana Jugador 1")
} else if jugador1 == Mano.papel && jugador2 == Mano.piedra
{
    print("Gana Jugador 1")
} else if jugador1 == jugador2
{
    print("Empate")
} else
{
    print("Gana Jugador 2")
}//13
