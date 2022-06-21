import UIKit

//Definir un array de tuplas (String, String) y añadimos algunas palabras traducidas (español, inglés)
var spanishEnglish:[(es: String, en: String)] = [("Hola","Hello")]
spanishEnglish.append(("Adios","Bye"))
///print(spanishEnglish)

//Función que busca la traducción en ambos sentidos, devuelve la traducción o un mensaje de error, si no se encuentra.
func translate(palabra: String) -> String
{
    var respuesta = "Not Found!!"
    for (es, en) in spanishEnglish
    {
        if (es == palabra)
        {
            respuesta = "Español: \(es) English: \(en)"
        } else if (en == palabra)
        {
            respuesta = "English: \(en) Español: \(es)"
        }
    }
    return respuesta
}
var busqueda = translate(palabra: "Comer")


//Función que permite añadir una palabra con su traducción
func add(es: String, en: String)
{
    spanishEnglish.append((es, en))
}
var newWord: () = add(es: "Comer", en: "Eat") /// : () WARNING
print(spanishEnglish)

//(Opcional) Función que permite modificar una palabra
func modify(palabraESP: String, palabraENG: String, modify: String, spain: Bool)
{
    var cont = 0
    for (es, en) in spanishEnglish
    {
        if (es == palabraESP && spain == true)
        {
            spanishEnglish[cont] = (modify, palabraENG)
        } else if (en == palabraENG && spain == false)
        {
            spanishEnglish[cont] = (palabraESP, modify)
        }
        cont += 1
    }
}
modify(palabraESP: "Adios", palabraENG: "Bye", modify: "HASTA LUEGO", spain: true)
print(spanishEnglish)

//(Opcional) Función que permite eliminar una palabra del diccionario
func delete(palabra: String)
{
    spanishEnglish.removeValue(forKey: palabra)
}
var borrar: () = delete(palabra: "Hola")
print(spanishEnglish)
