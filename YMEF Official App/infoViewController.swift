//
//  infoViewController.swift
//  YMEF Official App
//
//  Created by Titi Phan on 8/14/15.
//  Copyright (c) 2015 YMEF. All rights reserved.
//

import UIKit

class infoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "logo_YMEF.png")
        self.navigationItem.titleView = UIImageView(image: image)
        
    }
    
}