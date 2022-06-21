import Foundation
import CoreGraphics

class Animal
{
    // Declaracion de atributos
    let nombre: String
    var peso: Double

    // Constructor
    init(nombre: String, peso: Double)
    {
        self.nombre = nombre
        self.peso = peso
    }
    
    // Declaracion de funciones
    func comer(comida: Double)
    {
        peso += comida
    }
    
    func ruido()
    {
        print("Grrrrr")
    }
}

// Creamos un Animal
var miAnimal = Animal(nombre: "Tux", peso: 17.4)

miAnimal.comer(comida: 0.5)

struct valoresVitales // Por que esto luego se declara en la 53 y no en la 51 y porque esta fuera de la clase enemigo
{
    var fuerza: Int
    var vida: Int
}

class Enemigo
{
    // Declaracion de atributos
    let nombre: String
    let vital: valoresVitales
    
    // Constructor
    init(nombre: String, vital: valoresVitales)
    {
        self.nombre = nombre
        self.vital = vital
    }
    
    convenience init (nombre: String, fuerza: Int, vida: Int) // sobrecarga metodos
    {
        let vital = valoresVitales(fuerza: fuerza, vida: vida)
        self.init(nombre: nombre, vital: vital)
    }
}

class Orco:Enemigo // Clase que hereda de ENEMIGO
{
    // Declaracion de atributos
    var clan: String
    
    // Constructor
    init(nombre: String, vital: valoresVitales, clan: String)
    {
        self.clan = clan
        super.init(nombre: nombre, vital: vital)
    }
    
    convenience init(nombre: String, fuerza: Int, vida: Int, clan: String)
    {
        let vitalOrco = valoresVitales(fuerza: fuerza, vida: vida)
        self.init(nombre: nombre, vital: vitalOrco, clan: clan)
    }
}

// es nevesario primero hacer la estructura
var vitalBuu = valoresVitales(fuerza: 30, vida: 50)
let buu = Enemigo(nombre:"Buu", vital: vitalBuu)

let shrek = Orco(nombre: "Shrek", fuerza: 100, vida: 50 , clan: "VillaMojada")
//otra forma de hacer Shrek

let shrek2 = Orco(nombre: "Shrek2", vital: valoresVitales(fuerza: 100, vida: 50),clan: "Disney")

//Definimos una extension de la clase Enemigo con una propiedad calculada
extension Enemigo
{
    var valia: Int
    {
        return (self.vital.fuerza * self.vital.vida)
    }
}

shrek.vital.vida
shrek.vital.fuerza
shrek.valia

class Perro: Animal
{
    public let color: String /// Esta en solo lectura (let) si queremos que se pueda escribir seria (var)
    private var numeroPatas: Int
    public var patas: Int
    {
        get /// GETTER & SETTER
        {
            return self.numeroPatas
        }
        set(nuevoValor)
        {
            if nuevoValor <= 4 && nuevoValor >= 0
            {
                self.numeroPatas = nuevoValor
            } else
            {
                print("El valor es incorrecto (4 patas max) o acaso eres una araña?")
            }
        }
    }
    
    init()
    {
        color = "Blanco"
        numeroPatas = 4
        super.init(nombre: "perrito", peso: 1)
    }
    
    override func ruido()
    {
        print("Guau!")
    }
}

var miPerro = Perro()
print(miPerro.color)
// miPerro.color = "Negro" /// Error: variable solo lectura
print(miPerro.patas)
miPerro.patas = 3

miPerro.patas = 10 // Error: num patas excedido

//APUNTES
    // CASTING: Upcasting / Downcasting (Upcasting: si sube en la herencia del heredero al padre)
        /// Upcasting porque estamos casrteando un objeto de la clase perro a la clase Animal
        var animal: Animal = miPerro

        animal.ruido()

        /// Downcasting (sin validacion) nos sirve cuando tenenos un objeto que ya tenia un upcasting
        var miAnimal2 = Animal(nombre: "Animalico", peso: 3)
        var otroPerro: Perro
        otroPerro = animal as! Perro
        otroPerro.color

        /// DOWNCASTING (con validacion)
        if let unPerro = animal as? Perro /// cuando ponemos as? es con validacion
        {
            print("Tenemos un perro \(unPerro.color)")
        } else
        {
            print("No es un perro")
        }
