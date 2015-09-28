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
import Foundation


class mapContainerViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    // get user preferences
    let defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var mapView: MKMapView!
    
    /**
        Centers the MapView to the current location
    */
    @IBAction func showCurrentLocation(sender: AnyObject) {
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.startUpdatingLocation()
        
    }
    
    /**
        Presents a modal view of map options
    */
    @IBAction func showMapOptions(sender: AnyObject) {
        
        let optionsView = self.storyboard!.instantiateViewControllerWithIdentifier("MapOptionsView") 
        optionsView.view.backgroundColor = UIColor.clearColor()
        optionsView.modalPresentationStyle = UIModalPresentationStyle.OverFullScreen
        self.presentViewController(optionsView, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // check and set user default settings if empty
        checkMapSettingsAndSetIfEmpty()
        
        mapView.delegate = self
        
        // add YMEF logo to top of view (in the navigation bar)
        let image = UIImage(named: "logo_YMEF.png")
        self.navigationItem.titleView = UIImageView(image: image)
        
        // initial location to show on map (University of Minnesota campus)
        let initialLocation = CLLocation(latitude: 44.9747, longitude: -93.2354)
        centerMapOnLocation(initialLocation)
        
        loadAndPresentAnnotations()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let regionRadius: CLLocationDistance = 1000
    
    /**
        
        Centers the MapView at the given location
    
        - parameter location: Location to center the map
    */
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
            regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    /**
    
    */
    func loadAndPresentAnnotations(){
        
        // check options and determine which annotations to load
        
        //TODO: this is a messy test; make sure to organize data clearly
        let ccStop = CampusConnectorStop(title: "A campus connector stop", locationName: "Near here", coordinate: CLLocationCoordinate2D(latitude: 44.9647, longitude: -93.2354))
        let ccStop2 = CampusConnectorStop(title: "A campus connector stop2", locationName: "A stop", coordinate: CLLocationCoordinate2D(latitude: 44.9747, longitude: -93.2454))
        let ccStop3 = CampusConnectorStop(title: "A campus connector stop3", locationName: "Text", coordinate: CLLocationCoordinate2D(latitude: 44.9747, longitude: -93.2354))
        let ccStops = [ccStop, ccStop2, ccStop3]
        mapView.addAnnotations(ccStops)
    }
    
    /**
        Loads initial data to present on the map. Most of this data is used to present pins and annotations.
    */
    func loadInitialData() {
        
    }
    
    // MARK: - location manager to authorize user location for Maps app
    var locationManager = CLLocationManager()
    
    /**
        Checks the app's authorization status for using location services
    */
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
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last as CLLocation!
        
        centerMapOnLocation(location)
        
        self.locationManager.stopUpdatingLocation()
    }
    
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Errors: \(error.localizedDescription)", terminator: "")
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}

extension mapContainerViewController {
    
    /**
        Sets default values for map preferences if preferences are empty. Default values will only 
        need to be set when the app is first used.
    */
    func checkMapSettingsAndSetIfEmpty() {
        for preference in MapOptionsView.preferenceKeys {
            if defaults.objectForKey(preference) == nil {
                print("set default value \(preference)")
                defaults.setBool(true, forKey: preference)
                // set default value (showCampusConnectorStops == True)
            }
        }
        
    }
}
