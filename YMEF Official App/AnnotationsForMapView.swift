//
//  AnnotationsForMapView.swift
//  YMEF Official App
//
//  Created by David Schommer on 8/27/15.
//  Copyright (c) 2015 YMEF. All rights reserved.
//

import Foundation

import MapKit

extension mapContainerViewController: MKMapViewDelegate {
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        if let annotation = annotation as? CampusConnectorStop {
            // identifier so we don't mistakenly deque annotations of different styles
            let identifier = "pin"
            var view: MKPinAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
                as? MKPinAnnotationView {
                    dequeuedView.annotation = annotation
                    view = dequeuedView
            } else {
                // 3
                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton.buttonWithType(.DetailDisclosure) as! UIView
            }
            view.image = annotation.pinImage!
            return view
        }
        return nil
    }
}
