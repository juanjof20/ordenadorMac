//
//  ViewController.swift
//  peticiones
//
//  Created by A1-IMAC08 on 13/1/22.
//

import UIKit

class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //self.downloadDataGet()
        //self.downloadDataGet2()
        //self.downloadDataPost()
    }
    
    @IBOutlet var botonCompartir: UIButton!
    
    /// Algunas funcionalidades al compartir
    @IBAction func compartirButton(_ sender: Any) ///ejecutar app para comprobar como queda
    {
        let textoACompartir = "Bajate la app"
        
        if let myWeb = NSURL(string: "https://escuelaestech.es")
        {
            let imageToShare = UIImage(named: "logo")
            
            let objectsToShare:[Any] = [textoACompartir, myWeb, imageToShare!]
        
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        
            // Para pantallas grandes
            activityVC.popoverPresentationController?.sourceView = sender as? UIView
            
            //activityVC.popoverPresentationController?.barButtonItem = sender // Esto para cuando el boton de compartir esta en el avigation controller en la barra de navegacion (Esto sustituiria a la linea 36)
            
//            if let popover = activityVC.popoverPresentationController
//            {
//                popover.sourceView = botonCompartir
//                popover.barButtonItem = botonCompartir // Para cuando el boton de compartir esta en la barra de navegacion
//            }
        
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    
    //PETICION GET
    func downloadDataGet()
    {
        let urlString = "https://qastusoft.com.es/apis/frase.php"
        guard let url = URL(string: urlString) else { return } /// guard es como un if let de #objetiveC
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil
            {
                print((error!.localizedDescription))
            }
            
            if response != nil
            {
                print(response ?? "No se ha obtenido respuesta") /// con el default ?? no nos saldria que era opcional o con lo de abajo tambien
            }
            
            if let res = response as? HTTPURLResponse
            {
                print("Status code: \(res.statusCode)")
            }
            
            guard let data = data else { return }
            
            print(data)
            
///            /// Si el data comtiene texto plano que recogemos de la url de qastusoft
///            if let respuesta = String(data: data, encoding: String.Encoding.utf8)
///            {
///                print("Respuesta: \(respuesta)")
///            }
        }.resume() /// esto sirve para que ejecute la peticion
    }

    //PETICION GET
    let user = "Junkero"
    let pass = "Junkero."

    func downloadDataGet2()
    {
        let urlString = "https://qastusoft.com.es/apis/login.php?user=\(user)&pass=\(pass)"
        guard let url = URL(string: urlString) else { return } /// guard es como un if let de #objetiveC
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil
            {
                print((error!.localizedDescription))
            }
            
            if response != nil
            {
                print(response ?? "No se ha obtenido respuesta") /// con el default ?? no nos saldria que era opcional o con lo de abajo tambien
            }
            
            if let res = response as? HTTPURLResponse
            {
                print("Status code: \(res.statusCode)")
            }
            
            guard let data = data else { return }
            
            print(data)
///            /// Si el data comtiene texto plano que recogemos de la url de qastusoft
///            if let respuesta = String(data: data, encoding: String.Encoding.utf8)
///            {
///                print("Respuesta: \(respuesta)")
///            }
            
            /// La respuesta viene en JSON
            do
            {
                let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as! [String:Any]
                print("\(String(describing: json["code"]!)): \(json["data"] ?? "")")
            } catch let jsonError { print(jsonError) }
        }.resume() /// esto sirve para que ejecute la peticion
    }
    
    
    //PETICION POST
    func downloadDataPost()
    {
        let urlString = "https://qastusoft.com.es/apis/login.php"
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.setValue("Application/x-www-form-urlencoded", forHTTPHeaderField: "Content-type")
        
        // Variables
        let bodyData = "user=\(user)&pass=\(pass)"
        
        request.httpBody = bodyData.data(using: String.Encoding.utf8)
        
        let session =  URLSession.shared.dataTask(with: request)
        {
            (data, response, error) in
            
            if error != nil
            {
                print((error!.localizedDescription))
            }
            
            if response != nil
            {
                print(response ?? "No se ha obtenido respuesta") /// con el default ?? no nos saldria que era opcional o con lo de abajo tambien
            }
            
            if let res = response as? HTTPURLResponse
            {
                print("Status code: \(res.statusCode)")
            }
            
            guard let data = data else { return }
            
            print(data)
///            /// Si el data comtiene texto plano que recogemos de la url de qastusoft
///            if let respuesta = String(data: data, encoding: String.Encoding.utf8)
///            {
///                print("Respuesta: \(respuesta)")
///            }
            
            /// La respuesta viene en JSON
            do
            {
                let json = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as! [String:Any]
                print("\(String(describing: json["code"]!)): \(json["data"] ?? "")")
            } catch let jsonError { print(jsonError) }
        }.resume() /// para ejecutar la peticion!!
    }
}
