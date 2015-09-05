//
//  BlogPostViewController.swift
//  YMEF Official App
//
//  Created by David Schommer on 9/5/15.
//  Copyright (c) 2015 YMEF. All rights reserved.
//

import UIKit

class BlogPostViewController: UIViewController {
    
    
    @IBOutlet weak var blogPostTitle: UILabel!
    
    var testText : String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.blogPostTitle.text = testText!

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setBlogPostData(title: String) {
        blogPostTitle.text = title
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
