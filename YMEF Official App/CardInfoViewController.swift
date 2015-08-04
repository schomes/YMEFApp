//
//  CardInfoViewController.swift
//  YMEF Official App
//
//  Created by David Schommer on 5/31/15.
//  Copyright (c) 2015 YMEF. All rights reserved.
//

import UIKit

class CardInfoViewController: UIViewController {

    @IBAction func dismiss(sender: AnyObject) {
            self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let image = UIImage(named: "logo_YMEF.png")
        navigationItem.titleView = UIImageView(image: image)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
