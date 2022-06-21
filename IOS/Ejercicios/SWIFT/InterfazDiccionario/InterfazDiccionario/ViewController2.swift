//
//  ViewController2.swift
//  InterfazDiccionario
//
//  Created by A1-IMAC08 on 18/1/22.
//

import UIKit

class ViewController2: ViewController, UITableViewDelegate, UITableViewDataSource
{
    var diccionario = [(String, String)]()
    @IBOutlet var tabla: UITableView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        VariablesNew.diccionario.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! MiCelda
        cell.palabraES.text =  VariablesNew.diccionario[indexPath.row].es
        cell.imgES.image = UIImage(named: "spain")
        cell.palabraEN.text =  VariablesNew.diccionario[indexPath.row].en
        cell.imgEN.image = UIImage(named: "united-kingdom")
        return cell
    }
    
//    func modify(palabraESP: String, palabraENG: String, modify: String, spain: Bool)
//    {
//        var cont = 0
//        for (es, en) in VariablesNew.diccionario
//        {
//            if (es == palabraESP && spain == true)
//            {
//                VariablesNew.diccionario[cont] = (modify, palabraENG)
//            } else if (en == palabraENG && spain == false)
//            {
//                VariablesNew.diccionario[cont] = (palabraESP, modify)
//            }
//            cont += 1
//        }
//    }
    
    func delete(_ index: IndexPath)
    {
        VariablesNew.diccionario.remove(at: index.row)
    }
    
    func compartir(_ index: IndexPath)
    {
        let textoACompartir = "Mira la traducción de esta palabra:"
        let transES = VariablesNew.diccionario[index.row].es
        let transEN = VariablesNew.diccionario[index.row].en
        let objectsToShare:[Any] = [textoACompartir, transES, transEN]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
//        // Modify action
//        let modify = UIContextualAction(style: .normal, title: "Modificar") { [weak self] (action, view, completionHandler) in
//            self?.modify(palabraESP: <#String#>, palabraENG: <#String#>, modify: <#String#>, spain: <#Bool#>) // Aqui que tengo que poner
//            completionHandler(true)
//        }
//        modify.backgroundColor = .systemGreen

        // Delete action
        let delete = UIContextualAction(style: .destructive, title: "Eliminar") { [weak self] (action, view, completionHandler) in
            self?.delete(indexPath)
            completionHandler(true)
            self?.tabla.reloadData()
        }
        delete.backgroundColor = .systemRed

        // Share action
        let share = UIContextualAction(style: .normal, title: "Compartir") { [weak self] (action, view, completionHandler) in
            self?.compartir(indexPath)
            completionHandler(true)
        }
        share.backgroundColor = .systemBlue

        let configuration = UISwipeActionsConfiguration(actions: [delete, share])
        return configuration
    }
}
