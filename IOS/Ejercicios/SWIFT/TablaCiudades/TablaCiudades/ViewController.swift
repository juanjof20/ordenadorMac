//
//  ViewController.swift
//  TablaCiudades
//
//  Created by A1-IMAC08 on 21/12/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    @IBOutlet var tabla: UITableView!
    
    let cityList = ["Linares", "Granada", "Málaga", "Madrid", "Barcelona"]
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var filteredCities = [String]()
    
    var isSearchBarEmpty: Bool
    {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool
    {
        return searchController.isActive && !isSearchBarEmpty
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        tabla.delegate = self
        tabla.dataSource = self
        
        searchController.searchResultsUpdater = self // Informa a la clase de cambios en el UISearchBar
        
        searchController.obscuresBackgroundDuringPresentation = false // esto lo que hace es oscurecer el serachbar cuando esta siendo usado
        
        searchController.searchBar.placeholder = "Buscar ciudad" // PreText
        
        // Añadir el searchBar al navigationItem
        navigationItem.searchController = searchController
        
        definesPresentationContext = true // Hace que esta barra solo aparezca en esta clase
    }
    
    func filterContentForSearchText(_ searchText: String) // filtro para busqueda
    {
        filteredCities.removeAll(keepingCapacity: false)
        filteredCities = cityList.filter{ (city: String) -> Bool in
            if city.lowercased().localizedCaseInsensitiveContains(self.searchController.searchBar.text!)
            {
                return true
            } else
            {
                return false
            }
        }
        tabla.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if isFiltering
        {
            return filteredCities.count
        } else
        {
            return cityList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! MiCelda
        
        if isFiltering
        {
            cell.miLabel.text =  filteredCities[indexPath.row]
            cell.miImagen.image = UIImage(named: filteredCities[indexPath.row])
        } else
        {
            cell.miLabel.text =  cityList[indexPath.row]
            cell.miImagen.image = UIImage(named: cityList[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 204
    }
    
    // Cuando haces click en la imagen sale por consola el indexPath
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
//        if isFiltering
//        {
//            print(filteredCities[indexPath.row])
//        } else
//        {
//            print(cityList[indexPath.row])
//        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "secondVC") as! ViewController2
        //self.present(vc, animated: true, completion: nil)
        vc.nombre = isFiltering ? filteredCities[indexPath.row] : cityList[indexPath.row] // esto es un operador ternario que nos acorta tener que crear un coindicional
//        self.navigationController?.setViewControllers([vc], animated: true) de esta manera no sale el BOTON ATRAS
        self.navigationController?.show(vc, sender: nil)
    }
}

extension ViewController: UISearchResultsUpdating
{
    func updateSearchResults(for searchController: UISearchController)
    {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}
