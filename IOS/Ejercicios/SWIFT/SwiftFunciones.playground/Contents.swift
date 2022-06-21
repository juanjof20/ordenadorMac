import UIKit

// FUNCIONES SWIFT
    /// Numero fijo de variables
    func suma(op1: Int, op2: Int) -> Int
    {
        return op1 + op2;
    }
    var resultado = suma(op1: 7, op2: 4); print("- Funcion suma: \(resultado)") /// Si func suma(op1: Int, _ op2: Int) aqui seria:  suma(op1: 7,  4) (Omitimos el op2:)

    /// Sin limite de variables
    func suma(ops: Int...) -> Int
    {
        var total = 0
        for op in ops
        {
            total += op
        }
        return total
    }
    let sumatorio = suma(ops: 7, 5, 3, 17); print("- Funcion sumatorio: \(sumatorio)")

    /// Con mas de un valor de return
    func partir(num: Int) -> (Int, Int)
    {
        let mitad1 = num / 2
        let mitad2 = num - mitad1
        return (mitad1, mitad2)
    }
    let mitades = partir(num: 11); print("- Las mitades sin decimales serian: \(mitades.0) y \(mitades.1)")

    func diHola()
    {
        print("Hola!!")
    }
    diHola()

    func unirCadenas(cadenas:[String], _ separador:Character = " " ) -> String /// _ para que luego no haya que escribir la palabra separador;   = " " son sus valores por defecto
    {
        var union:String = ""
        for cadena in cadenas
        {
            union += cadena
            union += String(separador)
        }
        return union
    }
    //let cadena1 = unirCadenas(cadenas: ["Hola", "mundo", "mundial"], separador:"-"); print(cadena1) /// Asi seria si no estuviese el _
    let cadena1 = unirCadenas(cadenas: ["Hola", "mundo", "mundial"], "-"); print(cadena1) /// Separador propio
    let cadena2 = unirCadenas(cadenas: ["Hola", "mundo", "mundial"]); print(cadena2)      /// Separador por defecto

// ESTRUCTURA
    struct Rectangulo
    {
        var ancho = 0.0
        var alto = 0.0
    /*
        init(lado:Double)
        {
            ancho = lado
            alto = lado
        }
    */
        func area() -> Double
        {
            return alto * ancho
        }
    }
    let unRectangulo = Rectangulo(ancho: 5, alto: 7)
    let area = unRectangulo.area()
