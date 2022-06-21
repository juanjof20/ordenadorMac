//
//  ViewController2.swift
//  TablaCiudades
//
//  Created by A1-IMAC08 on 11/1/22.
//

import UIKit

class ViewController2: UIViewController
{
    var nombre = ""
    @IBOutlet var nombreLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nombreLabel.text = nombre
    }
}
