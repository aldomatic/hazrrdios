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
import Parse

class ViewController: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
    
    var locationManager = CLLocationManager()
    var mapView:GMSMapView!
    var camera:GMSCameraPosition!
    @IBOutlet var googleMapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view = self.mapView
        self.locationManager.delegate = self
        self.googleMapView.delegate = self
        self.locationManager.requestAlwaysAuthorization()
        self.navigationItem.hidesBackButton = true
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    

    
//    func mapView(mapView: GMSMapView!, didChangeCameraPosition position: GMSCameraPosition!) {
//        print("didChangeCameraPosition: \(position.target)")
//    }
    
    func mapView(mapView: GMSMapView!, willMove gesture: Bool) {
        print("willMove: \(gesture)")
    }
    
    
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == CLAuthorizationStatus.AuthorizedAlways{
            self.googleMapView.myLocationEnabled = true
            self.locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.first{
            self.googleMapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
            print("Lat: \(location.coordinate.latitude) & Lng: \(location.coordinate.longitude)")
            self.addMarkers()
            self.locationManager.stopUpdatingLocation()
        }

    }
    

    
    func addMarkers(){
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 33.02436397414, longitude: -96.7882628180988)
        marker.icon = UIImage(named: "Assistant_Markers")
        marker.map = self.googleMapView
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

