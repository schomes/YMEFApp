//
//  mapContainerViewController.swift
//  YMEF Official App
//
//  Created by David Schommer on 8/5/15.
//  Copyright (c) 2015 YMEF. All rights reserved.
//
// Created with help from these resources:
// Map View - Current Location in Swift - Xcode 7 iOS 9 Tutorial
// https://www.youtube.com/watch?v=qrdIL44T6FQ
//
// Mapkit Tutorial: Getting Started
// http://www.raywenderlich.com/90971/introduction-mapkit-swift-tutorial

import UIKit
import MapKit
import CoreLocation

class mapContainerViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func showCurrentLocation(sender: AnyObject) {
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.startUpdatingLocation()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var image = UIImage(named: "logo_YMEF.png")
        self.navigationItem.titleView = UIImageView(image: image)
        
        let initialLocation = CLLocation(latitude: 44.9747, longitude: -93.2354)
        centerMapOnLocation(initialLocation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let regionRadius: CLLocationDistance = 1000
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    // MARK: - location manager to authorize user location for Maps app
    var locationManager = CLLocationManager()
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        checkLocationAuthorizationStatus()
        
        // set-up for current location
        self.locationManager.delegate = self
        
        self.mapView.showsUserLocation = true
        
    }
    
    
    // MARK: - Delegate Methods for Location
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        let location = locations.last as! CLLocation
        
//        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        centerMapOnLocation(location)
        
        self.locationManager.stopUpdatingLocation()
    }
    
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        print("Errors: \(error.localizedDescription)")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
