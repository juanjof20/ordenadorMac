//
//  ViewController.swift
//  Mapas
//
//  Created by A1-IMAC08 on 26/1/22.
//

import UIKit
import MapKit

class ViewController: UIViewController
{
    @IBOutlet var mapView: MKMapView!
    
    let initialLocation =
    CLLocation(latitude: 38.085838, longitude: -3.645547)

    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.configureMap()
    }
    
    func configureMap()
    {
        mapView.delegate = self
        self.centerMapOnLocation(location: initialLocation)
        self.showArtworkOnMap()
    }
    
    func centerMapOnLocation(location: CLLocation)
    {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func showArtworkOnMap()
    {
        let artwork = ArtWork(title: "Rotonda de Ibros", locationName: "Ibros City", discipline: "Rotonda", coordinate: CLLocationCoordinate2D(latitude: initialLocation.coordinate.latitude, longitude: initialLocation.coordinate.longitude))
        mapView.addAnnotation(artwork)
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl)
    {
        let location = view.annotation as! ArtWork
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving] // Este mode es para que nos lleve en coche, andando, etc.
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
}

extension ViewController: MKMapViewDelegate
{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        // Comprobamos que el annotation sea un objeto de la clase Artwork
        guard let annotation = annotation as? ArtWork else { return nil }
        
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        if let dequeuedView =  mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        {
            //Si estamnos reciclando el marker
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else
        {
            //Si creamos un nuevo objeto MKMarkerAnnotationView
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true // canShowCallout nos muestra la tarjetita
            view.calloutOffset = CGPoint(x: -5, y: +5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
}
