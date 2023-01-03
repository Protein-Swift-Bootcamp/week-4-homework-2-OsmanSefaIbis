//
//  PinMapVC.swift
//  Homework2
//
//  Created by Sefa İbiş on 3.01.2023.
//

import UIKit
import MapKit
import CoreLocation

class PinMapVC: UIViewController, UIGestureRecognizerDelegate {
    

    let coordinate = CLLocationCoordinate2D(latitude: 39.9251, longitude: 32.8368)
    
    let map = MKMapView()
    
    lazy var mapPanGestureRecognizer: UIPanGestureRecognizer = {
        let gr = UIPanGestureRecognizer(target: self, action: #selector(draggedMap))
        gr.delegate = self
        return gr
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(map)
        map.frame = view.bounds
        
        map.setRegion(MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(
                latitudeDelta: 0.01,
                longitudeDelta: 0.01
            )
        ),
        animated: false)
        addCustomPin()
        
        map.addGestureRecognizer(mapPanGestureRecognizer)
    }
    
    @objc func draggedMap(panGestureRecognizer: UIPanGestureRecognizer) {
        // Check to see the state of the passed panGestureRocognizer
        if panGestureRecognizer.state == UIGestureRecognizer.State.began {
            // Map Ekraninin sol ust ve sag alt coordinatlarini verir
            let point1Coord = CLLocationCoordinate2D(latitude: map.region.center.latitude + map.region.span.latitudeDelta / 2, longitude: map.region.center.longitude - map.region.span.longitudeDelta / 2)

            let point2Coord = CLLocationCoordinate2D(latitude: map.region.center.latitude - map.region.span.latitudeDelta / 2, longitude: map.region.center.longitude + map.region.span.longitudeDelta / 2)
            
            print("Coordinate 1 : \(point1Coord)")
            
            print("Coordinate 2 : \(point2Coord)")
        }
    }
    
    private func addCustomPin(){
        let pin = MKPointAnnotation()
        pin.title = "Here"
        pin.subtitle = "OOO"
        pin.coordinate = coordinate
        map.addAnnotation(pin)
    }
    
}
