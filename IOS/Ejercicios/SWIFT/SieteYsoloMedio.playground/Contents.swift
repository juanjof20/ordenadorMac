import UIKit
import Darwin

enum Palo: String
{
    case bastos = "bastos"
    case copas = "copas"
    case espadas = "espadas"
    case oros = "oros"
}

class Carta
{
// Delaracion de atributos
    public var value: Int?
    public var palo: Palo?

// Declaración de metodos
    init?(value:Int, palo:Palo)
    {
        self.palo = palo
        if (value <= 12 && value >= 1 && value != 8 && value != 9)
        {
            self.value = value
        } else
        {
            print("Error, el valor debe de estar entre 1 y 12 excepto 8 y 9")
        }
    }
    
    func descripcion() -> String
    {
        return "El \(self.value!) de \(self.palo!)"
    }
}

class Mano
{
// Delaracion de atributos
    public var cartas: [Carta]
    public var tamaño: Int

// Declaración de metodos
    init()
    {
        self.cartas = []
        self.tamaño = cartas.count
    }
    
    func addCarta(carta: Carta)
    {
        cartas.append(carta)
        tamaño += 1
    }
    
    func getCarta(posicion: Int) -> Carta?
    {
        if(posicion < 0 || posicion > tamaño)
        {
            return nil
        } else
        {
            return cartas[posicion]
        }
    }
}

var mano = Mano()
mano.addCarta(carta: Carta(value: 1, palo: .oros)!)
mano.addCarta(carta: Carta(value: 10, palo: .espadas)!)
mano.addCarta(carta: Carta(value: 7, palo: .copas)!)
print("Hay \(mano.tamaño) cartas")
for num in 0..<mano.tamaño
{
  if let carta = mano.getCarta(posicion: num)
    {
      print(carta.descripcion())
    }
}

class Baraja
{
// Delaracion de atributos
    public var cartas: [Carta]

// Declaración de metodos
    init()
    {
        self.cartas = []
        for palo in [Palo.bastos, Palo.espadas, Palo.copas, Palo.oros]
        {
            for valor in 1...12 where valor != 8 && valor != 9
            {cartas.append(Carta(value: value, palo: Palo)!)}
        }
    }
    func repartirCarta(){}
    func barajar(){}
}

enum estadoJuego
{
    case turnoJugador, ganaJugador, pierdeJugador, empate, noIniciado
}

class Juego
{
    var baraja : Baraja!
    var manoJugador : Mano!
    var estado : estadoJuego
    var jugadaMaquina : Double = 0.0

    init()
    {
        self.estado = estadoJuego.noIniciado
    }

    func comenzarPartida()
    {
        self.baraja = Baraja()
        self.baraja.barajar()
        self.manoJugador = Mano()
        
        jugadaMaquina = Double (Int.random(in: 1...7))
        if (Bool.random())
        {
            jugadaMaquina += 0.5
        }
    }
    func jugadorPideCarta(){}
    func jugadorSePlanta(){acabarPartida()}
    private func acabarPartida(){}
}
