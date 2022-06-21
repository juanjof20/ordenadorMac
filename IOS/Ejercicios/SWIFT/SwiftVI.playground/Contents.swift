import UIKit

class SimpleCar
{
    // Declaracion de atributos
    public let marca: String
    public let modelo: String
    public let nBas: Int
    
    init(marca: String, modelo: String, nBas: Int)
    {
        self.marca = marca
        self.modelo = modelo
        self.nBas = nBas
    }
    
    // Declaracion de funciones
    func pitar()
    {
        print("PIPIPIPIPIPIPIPPIPIPI")
    }
}

class Coche: SimpleCar
{
    // Declaracion de atributos
    enum colorenum
    {
        case Blanco, Negro, Rojo, Amarillo, Azul
    }
    public let year: Int
    public var color: colorenum

    init(marca: String, modelo: String, nBas: Int, year: Int, color: colorenum)
    {
        self.year = year
        self.color = color
        super.init(marca: marca, modelo: modelo, nBas: nBas)
    }
    
    // Declaracion de funciones
    override func pitar()
    {
        print("BUUUUUUUUUUUUUUUM")
    }
}

var meganeLoko = Coche(marca: "Renault", modelo: "Megane", nBas: 100001, year: 1999, color: Coche.colorenum.Blanco)

meganeLoko.color = Coche.colorenum.Negro
meganeLoko.pitar()

class Policia: Coche
{
    // Constructor
    override init(marca: String, modelo: String, nBas: Int, year: Int, color: colorenum)
    {
        if (color != colorenum.Blanco || color == colorenum.Azul)
        {
            super.init(marca: marca, modelo: modelo, nBas: nBas, year: year, color: color)
        } else
        {
            super.init(marca: marca, modelo: modelo, nBas: nBas, year: year, color: colorenum.Blanco)
        }
    }
    // Declaracion funciones
    func sirena()
    {
        print("SIRENA DE LOS MALOS")
    }
}
var losMalos = Policia(marca: "Citroen", modelo: "C4", nBas: 001312, year: 2020, color: Coche.colorenum.Azul)
print(losMalos)

//13. (opcional) El coche de policía sólo puede ser blanco o azul

//14. (opcional) Implementar la función sirena, que imprime el sonido en consola.

//15. (opcional) Hacer sonar la sirena.
