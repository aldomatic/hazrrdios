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
        self.camera = GMSCameraPosition.cameraWithLatitude(32.786005,longitude: -96.799779, zoom: 12)
        self.mapView = GMSMapView.mapWithFrame(CGRectZero, camera: self.camera )
        self.mapView.myLocationEnabled = true
        self.view = self.mapView
    
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
        
    }
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        print(status)
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            let location = locations.last
            print("Lat: \(location!.coordinate.latitude) & Lng: \(location!.coordinate.longitude)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

