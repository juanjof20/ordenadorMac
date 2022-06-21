//
//  MapasViewController.swift
//  SideMenuMapa
//
//  Created by A1-IMAC08 on 9/2/22.
//

import UIKit
import MapKit

class MapasViewController: UIViewController
{
    @IBOutlet var menuBT: UIBarButtonItem!
    @IBOutlet var mapView: MKMapView!
    
    let initialLocation = CLLocation(latitude: 38.093572256282734, longitude:  -3.6349379498428798)
    let estechLocation = CLLocation(latitude: 38.09286296684317, longitude: -3.6348958997836847)
    let regionRadius: CLLocationDistance = 250
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.configureSideMenus()
        self.configureMap()
    }
    
    func configureSideMenus()
    {
        if revealViewController() != nil
        {
            menuBT.target = revealViewController()
            menuBT.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 160
        }
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
        let artwork = ArtWork(title: "El Pósito", locationName: "El Pósito", discipline: "Museo", coordinate: CLLocationCoordinate2D(latitude: initialLocation.coordinate.latitude, longitude: initialLocation.coordinate.longitude))
        mapView.addAnnotation(artwork)
        
        let artworkEstech = ArtWork(title: "Escuela estech", locationName: "Escuela estech", discipline: "Escuela", coordinate: CLLocationCoordinate2D(latitude: estechLocation.coordinate.latitude, longitude: estechLocation.coordinate.longitude))
        mapView.addAnnotation(artworkEstech)
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl)
    {
        let location = view.annotation as! ArtWork
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
}

extension MapasViewController: MKMapViewDelegate
{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        guard let annotation = annotation as? ArtWork else { return nil }
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        
        if let dequeuedView =  mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView
        {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else
        {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: +5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            
            if view.annotation?.title == "El Pósito"
            {
                view.markerTintColor = .yellow
            }
        }
        return view
    }
}
