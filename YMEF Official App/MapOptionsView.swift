//
//  MapOptionsView.swift
//  YMEF Official App
//
//  Created by David Schommer on 8/16/15.
//  Copyright (c) 2015 YMEF. All rights reserved.
//

import UIKit

class MapOptionsView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBAction func dismissView(sender: AnyObject) {
//        updateMapPreferences()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        //
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.clearColor()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    var options = ["one", "two", "three"]
    
    // list of keys to access preferences in the defaults system (with NSUserDefaults)
    static let preferenceKeys = ["showCampusConnectorStops", "showDeals", "showConcerts"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return options.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("optionsCell", forIndexPath: indexPath) 

        let option = options[indexPath.row]
        cell.textLabel?.text = option

        return cell
    }

//
//    /*
//    // Override to support conditional editing of the table view.
//    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        // Return NO if you do not want the specified item to be editable.
//        return true
//    }
//    */
//
//    /*
//    // Override to support editing the table view.
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            // Delete the row from the data source
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//        } else if editingStyle == .Insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
//    }
//    */
//
//    /*
//    // Override to support rearranging the table view.
//    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
//
//    }
//    */
//
//    /*
//    // Override to support conditional rearranging of the table view.
//    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        // Return NO if you do not want the item to be re-orderable.
//        return true
//    }
//    */

     //MARK: - Navigation

    //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
         // Get the new view controller using [segue destinationViewController].
         // Pass the selected object to the new view controller.
    }

}

extension MapOptionsView {
    
    // manage map preferences/settings
    
    // update preference everytime a switch is toggled; use the string (title) to determine which one and switch value to determine preference value
    func updateMapPreferenceForKey(key: String, preferenceIsEnabled: DarwinBoolean) {
        print("did save preferences")
        
        // iterate through each preference and determine/save its value (switch is on or off) (don't iterate through the table, this is only a visual representation) 
    }


}





