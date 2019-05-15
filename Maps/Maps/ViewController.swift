//
//  ViewController.swift
//  Maps
//
//  Created by sneakysneak on 20/01/2019.
//  Copyright © 2019 sneakysneak. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let latitude: CLLocationDegrees = 40.7
        
        let longitude: CLLocationDegrees = -73.9
        
        let latDelta: CLLocationDegrees = 0.05
        
        let lonDelta: CLLocationDegrees = 0.05
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
        let coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: coordinates, span: span)
        
        map.setRegion(region, animated: true)
        
        // Annotiations under the pin of maps
        let annotation = MKPointAnnotation()
        
        annotation.title = "Taj Mahal"
        
        annotation.subtitle = "Once I'll go there..."
        
        annotation.coordinate = coordinates
        
        map.addAnnotation(annotation)
        
        //UI long press gesture recogniser
        let uilpr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        //Specify the length of the minimum long press, usually 2secs
        uilpr.minimumPressDuration = 2
        
        map.addGestureRecognizer(uilpr)
        
    }
    
    @objc func longpress(gestureRecognizer: UIGestureRecognizer) {
        
        let touchPoint = gestureRecognizer.location(in: self.map)
        
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coordinate
        
        annotation.title = "New place"
        
        annotation.subtitle = "Maybe"
    
    }
}

