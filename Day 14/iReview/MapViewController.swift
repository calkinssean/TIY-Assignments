//
//  MapViewController.swift
//  iReview
//
//  Created by Sean Calkins on 2/18/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
   
    var currentRestaurant : Restaurant?
    let regionRadius: CLLocationDistance = 1000
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(currentRestaurant?.latitude)
        print(currentRestaurant?.longitude)
        let newLatitude = currentRestaurant!.latitude
        let newLongitude = currentRestaurant!.longitude
        let myLocation = CLLocation(latitude: newLatitude, longitude: newLongitude)
        let center = CLLocationCoordinate2D(latitude: newLatitude, longitude: newLongitude)

        centerMapOnLocation(myLocation)
        
        self.createAnnotation("\(currentRestaurant!.name)", subTitle: "\(currentRestaurant!.location)", coordinate: center)
    
    }

    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error.localizedDescription)
    }
    
    func geoLocation(fullAddressString:String) {
        
        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(fullAddressString, completionHandler: { placemarks, error in
            
            
        })
    }
    
    func createAnnotation(title: String, subTitle: String, coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.title = title
        annotation.subtitle = subTitle
        annotation.coordinate = coordinate
        
        if self.mapView != nil {
            self.mapView.addAnnotation(annotation)
        }
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        
        let identifier = "MyPinIdentifier"
        
        
        // ensure annotation
        if annotation.isKindOfClass(MKUserLocation) {
            return nil
        }
        
        // Reuse the annotation if possible
        
        var annotationView:MKPinAnnotationView? = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            
            // pin color
            annotationView?.pinTintColor = UIColor.orangeColor()
            
            // Ensure proper use of identifier
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            
            // show Callout (true/false)
            annotationView?.canShowCallout = true
            
            let leftIconView = UIImageView(frame: CGRectMake(0, 0, 37, 30))
            leftIconView.image = UIImage(named: "\(currentRestaurant!.imageName)")
            annotationView?.leftCalloutAccessoryView = leftIconView
            //
            //            // Automatically select the annotation
            //            self.mapView.selectAnnotation(annotation, animated: false)
        }
        
        return annotationView
    }
    
    
}
