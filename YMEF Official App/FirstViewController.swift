//
//  FirstViewController.swift
//  YMEF Official App
//
//  Created by David Schommer on 5/28/15.
//  Copyright (c) 2015 YMEF. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let image = UIImage(named: "logo_YMEF.png")
        navigationItem.titleView = UIImageView(image: image)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

