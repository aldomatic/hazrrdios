//
//  ViewController.swift
//  Hazrrdproto
//
//  Created by Aldo Lugo on 1/13/16.
//  Copyright © 2016 Aldo Lugo. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    var mapView:GMSMapView!
    var camera:GMSCameraPosition!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView = GMSMapView.init(frame: self.view.bounds)
        self.view = self.mapView
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.AuthorizedAlways{
            self.mapView.myLocationEnabled = true
            self.locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first{
            self.mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            print("Lat: \(location.coordinate.latitude) & Lng: \(location.coordinate.longitude)")
            self.addMarkers()
            self.locationManager.stopUpdatingLocation()
        }

    }
    
    
    func addMarkers(){
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 33.02436397414, longitude: -96.7882628180988)
        marker.map = self.mapView
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

