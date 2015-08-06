//
//  blogViewController.swift
//  YMEF Official App
//
//  Created by Titi Phan on 8/6/15.
//  Copyright (c) 2015 YMEF. All rights reserved.
//

import UIKit

class blogViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var image = UIImage(named: "logo_YMEF.png")
        self.navigationItem.titleView = UIImageView(image: image)
        
    }

}
