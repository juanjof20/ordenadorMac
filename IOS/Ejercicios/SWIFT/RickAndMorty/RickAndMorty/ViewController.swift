//
//  ViewController.swift
//  RickAndMorty
//
//  Created by A1-IMAC08 on 26/1/22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
    /// DECLARACION
    @IBOutlet var collectionView: UICollectionView!
    var salida: [NSDictionary] = []
    var characters: Array<String> = []
    var charactersL: Array<NSDictionary> = []
    let url = "https://rickandmortyapi.com/api/character"
 
    override func viewDidLoad()
    {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        downloadDataGet(url: url)
    }
    
    /// FUNCIONES
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "celda", for: indexPath) as! MyCell
        let urlImage = URL(string: salida[indexPath.row]["image"] as! String)
        let content = try? Data(contentsOf: urlImage!)
        cell.nombreLB.text = salida[indexPath.row]["name"] as? String
        cell.especieLB.text = salida[indexPath.row]["species"] as? String
        cell.image.image = UIImage(data: content!)
        
        DispatchQueue.main.async
        {
            self.collectionView.reloadData()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = (collectionView.frame.width)
        return CGSize(width: width, height: width)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return salida.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        print(salida[indexPath.row])
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "details") as! ViewController2
        vc.details = salida[indexPath.row]
        self.navigationController?.show(vc, sender: nil)
    }
    
    func downloadDataGet(url: String)
    {
        guard let url = URL(string: url) else { return }
        
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
                self.salida = json["results"] as! [NSDictionary]
             
                DispatchQueue.main.async
                {
                    self.collectionView.reloadData()
                }
            } catch let jsonError { print(jsonError) }
        }.resume()
    }
}
