//
//  blogViewController.swift
//  YMEF Official App
//
//  Created by Titi Phan on 8/6/15.
//  Copyright (c) 2015 YMEF. All rights reserved.
//

import UIKit

class BlogViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var image = UIImage(named: "logo_YMEF.png")
        self.navigationItem.titleView = UIImageView(image: image)
        
        let blogURL = "http://blog.squarespace.com/?format=json-pretty"
        
        HTTPFetcher(urlPath: blogURL)
        
        // intead of calling HTTPFetcher, call JSONParser with blogURL
        // JSONParser will use an instance of HTTPFetcher to get the data
        // These classes are found in jsonHandler.swift
        
    }

}
