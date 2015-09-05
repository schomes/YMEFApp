//
//  BlogTableViewController.swift
//  YMEF Official App
//
//  Created by David Schommer on 8/15/15.
//  Copyright (c) 2015 YMEF. All rights reserved.
//

// TODO: to better follow MVC, consider moving some of the parsing code to its own class

import UIKit

class BlogTableViewController: UITableViewController, NSXMLParserDelegate {
    
    var parser = NSXMLParser()
    var feeds = NSMutableArray()
    var elements = NSMutableDictionary()
    var element = NSString()
    var ftitle = NSMutableString()
    var link = NSMutableString()
    var fdescription = NSMutableString()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 100
        
        var image = UIImage(named: "logo_YMEF.png")
        self.navigationItem.titleView = UIImageView(image: image)
        
        let pattern_bg = UIImage(named: "light_bg.png")
        view.backgroundColor = UIColor(patternImage: pattern_bg!)
        
        feeds = []
        // var urlString = "https://samantha-marlow.squarespace.com/config#/|/blog?format=rss"
        // var urlString = "http://www.formula1.com/rss/news/features.rss"
        // var urlStringEscaped = urlString.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
        
        // this URL doesn't work because squarespace needs you to login; we will wait for the website to be published
        // this may also be the cause of NSXMLParserErrorDomain Code = 76 (we're not displaying xml--no valid opening and closing tags)
//        var urlString = "https://samantha-marlow.squarespace.com/config#/%7C/blog?format=rss"
        var urlString = "https://samantha-marlow.squarespace.com/blog?format=rss"


        var url = NSURL(string: urlString)
        
        parser = NSXMLParser(contentsOfURL: url)!
        parser.delegate = self
        parser.shouldProcessNamespaces = false
        parser.shouldReportNamespacePrefixes = false
        parser.shouldResolveExternalEntities = false
        // start parsing
        parser.parse()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [NSObject : AnyObject]) {
        // called when the parser object encounters a start tag for an element
        
        // name of element (tag)
        element = elementName
        
        // set up feed properties
        if (element as NSString).isEqualToString("item") {
            // create empty dictionary (with dictionary literal [:]); this allows us to empty the dictionary 'elements' if it still has data in it
            elements = NSMutableDictionary.alloc()
            elements = [:]
            ftitle = NSMutableString.alloc()
            ftitle = ""
            link = NSMutableString.alloc()
            link = ""
            fdescription = NSMutableString.alloc()
            fdescription = ""
            
        }
        
    }
    
    func parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        // called when the parser object encounters the end-tag of an element; process the element
        // add data to 'elements' dictionary; ftitle, link, and fdescription are changed by calls to parser(_:foundCharacters:)
        
        if ftitle != "" {
            elements.setObject(ftitle, forKey: "title")
        }
        
        if link != "" {
            elements.setObject(link, forKey: "link")
        }
        
        if fdescription != "" {
            elements.setObject(fdescription, forKey: "description")
        }
        
        // add 'elements' dictionary to 'feeds' list
        if elementName == "item" {
            feeds.addObject(elements)
        }
        
    }
    
    func parser(parser: NSXMLParser, foundCharacters string: String?) {
        // contstruct the feed with the string representing all/part of the characters of the current element
        
        if element.isEqualToString("title") {
            ftitle.appendString(string!)
        } else if element.isEqualToString("link") {
            link.appendString(string!)
        } else if element.isEqualToString("description") {
            fdescription.appendString(string!)
        }
        
    }
    
    func parserDidEndDocument(parser: NSXMLParser) {
        // reload table view
        self.tableView.reloadData()
        println("\(feeds)")
    }
    
    func parser(parser: NSXMLParser, parseErrorOccurred parseError: NSError) {
        print("parse error: \(parseError)")
    }
    
    
    /**
        Get an image located by the specified URL

        :param: url A URL which points to an image
    */
    func getImageFromURL(url: NSURL) {
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return feeds.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BlogCell", forIndexPath: indexPath) as! UITableViewCell
        
        // Configure the cell...
        cell.textLabel?.text = feeds.objectAtIndex(indexPath.row).objectForKey("title") as? String
        cell.detailTextLabel?.numberOfLines = 3
        cell.detailTextLabel?.text = feeds.objectAtIndex(indexPath.row).objectForKey("description") as? String
        cell.imageView?.image = UIImage(named: "logo_YMEF.png")

        return cell
    }
    
    // MARK: - Navigation
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let item = feeds[indexPath.row] as! NSMutableDictionary
        
        let blogPostView: UIViewController = self.storyboard?.instantiateViewControllerWithIdentifier("blogPost") as! UIViewController
        
//        self.navigationController?.pushViewController(blogPostView, animated: true)
//        self.performSegueWithIdentifier("BlogPostSegue", sender: "")

        
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        var vc = segue.destinationViewController as! BlogPostViewController
        
        let blogPostTitle = sender!.textLabel!!.text
        
        vc.testText = blogPostTitle
        
        
    }

    
    
    
    
    
    
    
    
    
    //////////////////////////////////////////////////////////////
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */


    

}