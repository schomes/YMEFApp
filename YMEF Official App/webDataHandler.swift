//
//  jsonHandler.swift
//  YMEF Official App
//
//  Created by David Schommer on 8/7/15.
//  Copyright (c) 2015 YMEF. All rights reserved.
//

// fetch and parse JSON/RSS files
// Data source: https://samantha-marlow.squarespace.com/config#/|/blog?format=rss

import Foundation
import UIKit

// 1. get json from server
class HTTPFetcher {
    /* Fetches data using a HTTP GET request for a specified URL
     *
     * Properties:
     * url NSURL: URL of data
     *
     * Methods:
     * getJSON(url:): get JSON formatted data from a specified URL
     *
     * getRSS(url:): get RSS formatted data from a specified URL
     *
     *
     * Created with help from Calling APIs & Parsing JSON with Swift by Jeff Douglas
     * http://www.topcoder.com/blog/calling-apis-parsing-json-with-swift/
     */
    
    // make optional; we don't know if a URL will be provided
    let url: NSURL
    
    init(urlPath: String) {
        /* Class initializer
         * :param urlPath String: URL of JSON data
         */
        
        // is this necessary? perhaps create this class so it allows you to call its methods with URL passed in
        self.url = NSURL(string: urlPath)!
        
        // can take this call out later; used as a test right now
        getJSON(self.url)
    }
    
    func getJSON(url: NSURL) {
        /* Get JSON from url
         *
         * :param url NSURL: URL of JSON data
         *
         */
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithURL(url, completionHandler: {data, response, error -> Void in
            
            if error != nil {
                // if there is an error in the web request, print to console
                println(error.localizedDescription)
            }
            
            var err: NSError?
            // create JSON object
            // use data for json
            // options: MutableContainers specifies that arrays/dictionaries are mutable objects
            // if an error occurs, save that in err (above)
            var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as! NSDictionary
            
            // if an error occured when creating jsonResult
            if err != nil {
                println("JSON error: \(err!.localizedDescription)")
            }
            
            // test JSON
            if let item: AnyObject = jsonResult["website"] {
                if let jsonID: AnyObject = item["id"] {
                    print("Test: id is " + (jsonID as! String))
                }
            }
        })
        
        task.resume()
        
        // TODO: return the JSON data, however, we need to figure out how to deal with this asynchronous request
        // perhaps with protocols or delegates?
        // http://stackoverflow.com/questions/24792872/getting-data-out-of-completionhandler-in-swift-in-nsurlconnection
    }
    
    func getRSS(url: NSURL) {
        
    }
}

// 2. format saved json into usable data structure (BlogPost struct below)
class RSSParser {
    // Formats JSON into a usable data structure
    
    // parse JSON
//    if let item: AnyObject = jsonResult["data"] {
//        for index in 0...(item.count - 1) {
//            if let post: AnyObject = item[index] {
//                if let challengeType: AnyObject? = post["challengeName"] {
//                    println(challengeType!)
//                }
//            }
//        }
//    }
}

struct BlogPost {
    // manages the information of a blog post
    
    let title : String?
    let pubDate : String?
    let content : String?
    let image : UIImage?
    
}