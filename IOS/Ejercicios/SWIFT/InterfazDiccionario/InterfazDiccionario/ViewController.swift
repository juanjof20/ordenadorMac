//
//  ViewController.swift
//  InterfazDiccionario
//
//  Created by A1-IMAC08 on 12/1/22.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet var palabraTF: UITextField!
    @IBOutlet var palabraLB: UILabel!
    @IBOutlet var TranslateBT: UIButton!
    
    @IBAction func traducirBT(_ sender: Any)
    {
        let texto:String? = palabraTF.text
        palabraLB.text = translate(palabra: texto!)
    }
    
    @IBAction func newTransBT(_ sender: Any)
    {
        let storyboard1 = UIStoryboard(name: "Main", bundle: nil)
        let vc1 = storyboard1.instantiateViewController(withIdentifier: "tercerVC") as! ViewController3
        self.navigationController!.pushViewController(vc1, animated: true)
    }
    
    @IBAction func mostrarBT(_ sender: Any)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "secondVC") as! ViewController2
        ///UIModalTransitionStyle.flipHorizontal
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
    var message = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        
        // ESTA PARTE ES LA QUE DABA FALLO AL ENVIAR LA PALABRA DESDE SAFARI
//        palabraTF.text = message
//        if message != ""
//        {
//            TranslateBT.sendActions(for: .touchUpInside)
//        }
        
///        spanishEnglish = UserDefaults.standard.object(forKey: "diccionario") as? [(String, String)] ?? [(String, String)]()
///        // Recuperand o el diccionario de UserDefaults
///        // Añadir datos al UserDefaults
///        let defaults = UserDefaults.standard
///        defaults.set(37, forKey: "numero")
///        defaults.set(true, forKey: "boolean")
///        defaults.set("Juanjo", forKey: "name")
///        defaults.set(["uno","dos"], forKey: "array")
///
///        // Para leer
///        let numero = UserDefaults.standard.integer(forKey: "numero")
///        let boolean = UserDefaults.standard.bool(forKey: "boolean")
///        let nombre = UserDefaults.standard.string(forKey: "name")
///        //let arrays = UserDefaults.standard.array(forKey: "array")
///        var array = defaults.object(forKey: "array") as? [String] ?? [String]()
///        array.append("tres")
///        defaults.set(array, forKey: "array")
///        let array2 = defaults.set(array, forKey: "array") as? [String] ?? [String]()
///        print(array2)
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        //UserDefaults.standard.set(spanishEnglish, forKey: "diccionario")
    }
    
    func translate(palabra: String) -> String
    {
        var respuesta = ""
        for i in VariablesNew.diccionario
        {
            if (i.es == palabra)
            {
                respuesta = "Español: \(i.es) - Ingles: \(i.en)"
                return respuesta
            } else if (i.en == palabra)
            {
                respuesta = "English: \(i.en) - Spanish: \(i.es)"
                return respuesta
            }
        }
        palabraTF.text = respuesta
        return respuesta
    }
    
    func addW(es: String, en: String)
    {
        VariablesNew.diccionario.append((es, en))
    }
}

struct VariablesNew
{
    static var diccionario:[(es: String, en: String)] = [("hola","hello"),("adios","bye")]
}
