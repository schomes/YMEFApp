//
//  MapData.swift
//  YMEF Official App
//
//  Created by David Schommer on 8/27/15.
//  Copyright (c) 2015 YMEF. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class CampusConnectorStop: NSObject, MKAnnotation {
    
    let title: String
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    let pinImage = UIImage(named: "map_icon-campus_connector_stop")
    
    init (title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String {
        return "Next bus comes in ?? minutes."
    }
    
}

