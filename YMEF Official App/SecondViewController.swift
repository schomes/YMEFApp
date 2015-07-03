//
//  SecondViewController.swift
//  YMEF Official App
//
//  Created by David Schommer on 5/28/15.
//  Copyright (c) 2015 YMEF. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set background pattern for SecondViewController
        let pattern_bg = UIImage(named: "light_bg.png")
        view.backgroundColor = UIColor(patternImage: pattern_bg!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {

        // create imageView
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .ScaleAspectFit
        
        // put YMEF logo in navigation header
        let image = UIImage(named: "logo_YMEF.png")
        imageView.image = image
        navigationItem.titleView = imageView
    }

}

