//
//  PinMapVC.swift
//  Homework2
//
//  Created by Sefa İbiş on 3.01.2023.
//

import UIKit
import MapKit
import CoreLocation

class PinMapVC: UIViewController {
    

    let currentCoordinate = CLLocationCoordinate2D(latitude: 30, longitude: 28
    )
    
    let map = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(map)
        map.frame = view.bounds
        
        map.setRegion(MKCoordinateRegion(
            center: currentCoordinate,
            span: MKCoordinateSpan(
                latitudeDelta: 4,
                longitudeDelta:4
            
            )
        ),
        animated: false)
        
        let pin = MKPointAnnotation()
        pin.title = "Drag Me"
        pin.coordinate = currentCoordinate
        
        let annotView = mapView(map, viewFor: pin)
        view.addSubview(annotView!)
        
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        guard annotation is MKPointAnnotation else { return nil }
        let identifier = "marker"
        var view: MKAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.isDraggable = true
            view.canShowCallout = false
        }
        return view
    }
    func mapView(mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
            var center = mapView.centerCoordinate
   }
    
}




