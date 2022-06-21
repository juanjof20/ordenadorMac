import UIKit

// TUPLAS
    let coordenadas:(Float, Float) = (3.6234, -8.2386)
    let http = (code: 404, texto: "Not Found", go: true)
    let film:(pelicula: String, year: Int, rank: Float) = ("Interestellar", 2014, 10.0)

    /// Llamar a una tupla
    print(film.0)
    print(film.1)
    print("Pelicula \(film.0) del año \(film.1)")
    print("Pelicula \(film.pelicula) del año \(film.year)")

    let alumno = (nombre:"Juanjo", ciclo:"DAM", curso:2)
    let (pelicula, _, _) = film

    /// En este switch estamos buscando peliculas de determinados años, para ello usamos _ para indicar que ese dato nos lo saltamos porque no nos sirve para nuestra busqueda mas especifica
    switch (film)
    {
        case ("Insterestellar", 2013, 10.0):
            print("Esta es Interestellar")
        
        case (_, 2013, _):
            print("Pelicula de 2013")
        
        case (_, 2014, _):
            print("Pelicula de 2014")
        default: print("Otro año")
    }


// ARRAY
    var numeros = [3, 8, 5, 2]

    var nombres = ["Jose", "Angel", "Juanjo", "Roberto"]
    print(nombres[0])
    print(nombres[2])

    /// Añadir un elemento
    nombres.append("Manuel")
    print(nombres)

    print(nombres.count)
    print(nombres.isEmpty)
    var vacio2:[Int] = []
    print(vacio2.isEmpty)

    /// De esta manera reemplazamos la posicion del array por otra nueva
    nombres[2] = "Irene"
    print(nombres)

    nombres[1...2] = ["AngelNew", "IreneNew", "PacoNew"]
    print(nombres)

    nombres.append(contentsOf: ["asdf", "qwerty"])

    // ELIMINAR
    nombres.remove(at: 3)
    print(nombres)

    /// eliminacion entre un rango
    nombres.removeSubrange(1...2)

    /// esto lo podemos usar para borrar el ultimo y comprobar si se ha borrado, etc
    let eliminado = nombres.removeLast()
    print(nombres)
    nombres.removeFirst(3)
    print(nombres)

    //nombres.removeAll()
    nombres.append("Juanjo")
    print(nombres)

    print(numeros)
    numeros.reverse()
    print(numeros)

    /// para sacar todos los nombres del array
    for nombre in nombres
    {
        print(nombre)
    }

    /// para sacar la posicion y el valor
    for (index, value) in nombres.enumerated()
    {
            print("En la posicion \(index) está \(value).")
    }


// OPCIONALES
    ///Significa que aqui por ejemplo puede ser String aunque a veces puede que no lo sea,  por eso abajo si ponemos nil se lo come pero si quitamos ? el nil nos daria un error
    var religionOpcional: String?
    print(religionOpcional ?? "ninguna")///?? Para establecer un valor por defecto

    //religionOpcional = "Catolica"

    if religionOpcional != nil
    {
        print(religionOpcional!)///esta exclamacion quiere decir que estamos forzando  a que se imprima
    }

    if let religion = religionOpcional///Si religionOpcional tiene valor religion lo toma, si religionOpcional es nil entra al else
    {
        print(religion)
    } else
    {
        print("Ateo")
    }
