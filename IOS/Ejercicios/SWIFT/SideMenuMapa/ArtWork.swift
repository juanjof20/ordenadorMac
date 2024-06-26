//
//  ArtWork.swift
//  Mapas
//
//  Created by A1-IMAC08 on 26/1/22.
//

import Foundation
import MapKit
import Contacts

class ArtWork: NSObject, MKAnnotation
{
    let title: String?
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D)
    {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        super.init()
    }
    
    var subtitle: String?
    {
        return locationName
    }
    
    // Funcionalidad para abrir la aplicacion Maps al tocar en el accesorio del Annotation
    func mapItem() -> MKMapItem
    {
        let addressDict = [CNPostalAddressStateKey: subtitle!]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
}
