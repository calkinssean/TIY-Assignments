//
//  SecondViewController.swift
//  missingCar
//
//  Created by Sean Calkins on 2/16/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class FindCarViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    var locationManager = CLLocationManager()
    var newLatitude = 21.282778
    var newLongitude = 157.829444

    @IBAction func currentLocation(sender: UIButton) {
                locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
    }
    @IBOutlet weak var mapView: MKMapView!
    let regionRadius: CLLocationDistance = 1000

    var initialLocation = CLLocation(latitude: 21.282778, longitude: 157.82944)
    @IBAction func goToHawaii(sender: UIButton) {
        
        centerMapOnLocation(initialLocation)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch(status) {
        case .NotDetermined: print("I don't know if I have permission")
        case .AuthorizedWhenInUse: print("Authorized when in use")
        case .AuthorizedAlways: print("Authorized always")
        default: print("other")
        }
        
        if status != .Denied {
            manager.requestLocation()
        }
        print("Did change auth status")
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0 {
            let l = locations.first
            
            let coordinate = l?.coordinate
            
            print(coordinate?.latitude)
            print(coordinate?.longitude)
            
            if let center = coordinate {
                let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
                self.mapView.setRegion(region, animated: true)
                self.mapView.showsUserLocation = true
            }
        }
        
        
    }
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error.localizedDescription)
    }
    
    
}

