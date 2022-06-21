//
//  ViewController3.swift
//  InterfazDiccionario
//
//  Created by A1-IMAC08 on 18/1/22.
//

import UIKit

class ViewController3: UIViewController
{
    var diccionario = [(String, String)]()
    @IBOutlet var spTF: UITextField!
    @IBOutlet var enTF: UITextField!
    @IBAction func newBT(_ sender: Any)
    {
        let textoSP:String? = spTF.text
        let textoENG:String? = enTF.text
        VariablesNew.diccionario.append((textoSP!, textoENG!))
        let storyboard1 = UIStoryboard(name: "Main", bundle: nil)
        let vc1 = storyboard1.instantiateViewController(withIdentifier: "primerVC") as! ViewController
        self.navigationController!.pushViewController(vc1, animated: true)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
}
