//
//  ViewController2.swift
//  RickAndMorty
//
//  Created by A1-IMAC08 on 1/2/22.
//

import UIKit

class ViewController2: UIViewController
{
    /// DECLARACION
    @IBOutlet var compartirBT: UIButton!
    @IBAction func compartirActionBT(_ sender: Any)
    {
        let texto = "Compartiendo informacion sobre \(nombreLB.text!)"
        let imagen = details["image"]
        let objectsToShare:[Any] = [texto, imagen!]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = sender as? UIView
        self.present(activityVC, animated: true, completion: nil)
    }
    
    @IBOutlet var image: UIImageView!
    @IBOutlet var nombreLB: UILabel!
    @IBOutlet var especieLB: UILabel!
    @IBOutlet var generoLB: UILabel!
    @IBOutlet var origenLB: UILabel!
    @IBOutlet var localizacionLB: UILabel!
    
    var details: NSDictionary = [:]
    var characters: Array<String> = []
    var nCharacters: Array<String> = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let urlImage = URL(string: details["image"] as! String)
        let content = try? Data(contentsOf: urlImage!)
        image.image = UIImage(data: content!)
        nombreLB.text = (details["name"] as? String)
        especieLB.text = (details["species"] as? String)
        generoLB.text = (details["gender"] as? String)
        let location = details["location"] as! NSDictionary
        localizacionLB.text = (location["name"] as! String)
        let origin = details["origin"] as! NSDictionary
        origenLB.text = (origin["name"] as! String)
    }
    
    /// FUNCIONES
    func downloadDataGet()
    {
        let urlString = "https://rickandmortyapi.com/api/character"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil
            {
                print((error!.localizedDescription))
            }
            
            if response != nil
            {
                print(response ?? "No se ha obtenido respuesta")
            }
            
            if let res = response as? HTTPURLResponse
            {
                print("Status code: \(res.statusCode)")
            }
            guard let data = data else { return }
            
            do // JSON
            {
                let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as! [String:Any]
                self.characters = json["characters"] as! Array<String>
                
                DispatchQueue.main.async
                {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "inicio") as! ViewController
                    vc.characters = self.nCharacters
                    self.navigationController?.show(vc, sender: nil)
                }
            } catch let jsonError { print(jsonError) }
        }.resume()
    }
}
