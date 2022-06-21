import UIKit

//1. Crear una función que devuelva true o false según el número recibido sea par o no
    func par(num: Int) -> Bool
    {
        if num % 2 == 0
        {
            return true
        } else
        {
            return false
        }
    }
    par(num: 2)

//2. Dados dos números, comprobar si el primero es divisible entre el segundo. Para ello, crear una función que devuelve true si lo es, no en caso contrario.
    func divisible(num: Int, num2: Int) -> Bool
    {
        if num % num2 == 0
        {
            return true
        } else
        {
            return false
        }
    }
    divisible(num: 10, num2: 5)

//3. Dada una cantidad determinada de chicos y chicas, calcular el porcentaje de cada uno respecto al total. La función debe recibir un parámetro de tipo tupla y devolver los porcentajes en otra tupla
    func porcentaje(man: Int, woman: Int) -> (Int, Int)
    {
        let total = man + woman
        let manP = (man * 100) / total
        let womanP = (woman * 100) / total
        let resultados = (manP, womanP)
        
        print("3. Hombres \(resultados.0)% y Mujeres \(resultados.1)%")
        return resultados
    }
    porcentaje(man: 5, woman: 5)

//4. Crear una función que recibe 2 tuplas (Int,Int). Cada tupla representa una fracción (numerador, denominador). La función debe devolver la suma de las dos fracciones
    func sumaFracciones(fraccion1: (Int, Int), fraccion2: (Int, Int)) -> (Int, Int)
    {
        let numerador = fraccion1.0 * fraccion2.1 + fraccion2.0 * fraccion1.1
        let denominador = fraccion1.1 * fraccion2.1
        return (numerador, denominador)
    }

    let fraccion1 = (1, 3)
    let fraccion2 = (2, 4)
    sumaFracciones(fraccion1: fraccion1, fraccion2: fraccion2)

//5. Desarrollar una clase para comprobar si un año es bisiesto:
    func bisiesto (year: Int) -> Bool
    {
        let year = 2021
        let e4 = year % 4 == 0
        let e100 = year % 100 == 0
        let e400 = year % 400 == 0
        
        if e4 && (!e100 || e400)
        {
            return true
        } else
        {
            return false
        }
    }

//6. Escribir una función llamada “saluda”, que recibe un nombre y devuelve la frase “Hola + nombre”. Llamar a la función e imprimir la respuesta.
    func saludar (nombre: String)
    {
        print("6. Hola \(nombre)")
    }
    saludar(nombre: "juan")

/*PARA CUANDO VEAMOS LAS CLASES*/

//7 y 8. Crea una clase llamada Persona. Esta clase deberá tener un atributo «nombre», de tipo String. También deberá tener un método «setNombre», con un parámetro String, que permita cambiar el valor del nombre. Finalmente, también tendrá un método «saludar», que escribirá en pantalla «Hola, soy » seguido de su nombre.
    class Persona
    {
        public var nombre: String
        
        init(nombre: String)
        {
            self.nombre = nombre
        }
        
        func setNombre(nombre: String)
        {
            self.nombre = nombre
        }
        
        func saludar()
        {
            print("7&8. Hola, soy \(nombre)")
        }
    }
    var persona1 = Persona(nombre: "Juan")
    persona1.setNombre(nombre: "Juanjo")
    persona1.saludar()

//9. (Opcional) Crea también una clase llamada PruebaPersona. Esta clase deberá contener sólo la función main, que creará dos objetos de tipo Persona, les asignará un nombre a cada uno y les pedirá que saluden.
    class PruebaPersona
    {
        func main()
        {
            let persona1 = Persona(nombre: "junkjero")
            let persona2 = Persona(nombre: "robert")
            
            persona1.setNombre(nombre: "Pepe")
            persona2.setNombre(nombre: "Juan")
            
            persona1.saludar()
            persona2.saludar()
        }
    }

    var prueba = PruebaPersona()
    prueba.main()

//10. (Opcional) Modificar la clase «PersonaInglesa» para que redefina el método «Saludar», para que escriba en pantalla «Hi, I am » seguido de su nombre;

//11. (opcional) se creará una nueva clase «PersonaItaliana», que deberá heredar las características de la clase «Persona», pero se deberá redefinir el método «Saludar», para que escriba en pantalla «Ciao»;

//12. (opcional) crea también una clase llamada PruebaPersona3, que deberá contener sólo la función «main» y creará un objeto de tipo «Persona», uno de tipo «PersonaInglesa», y uno de tipo «PersonaItaliana», les asignará un nombre, les pedirá que saluden y pedirá a la persona inglesa que tome té.
