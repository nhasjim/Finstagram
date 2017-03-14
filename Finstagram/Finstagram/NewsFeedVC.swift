//
//  NewsFeecVC.swift
//  Finstagram
//
//  Created by Nick Hasjim on 3/12/17.
//  Copyright © 2017 Nick Hasjim. All rights reserved.
//

import UIKit
import Parse

class NewsFeedVC: UIViewController,  UITableViewDelegate, UITableViewDataSource {

    var finstaPosts: [NSObject]?
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self
        self.tableView.estimatedRowHeight = 350
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        getPosts()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        getPosts()
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOutInBackground { (error: Error?) in
        }
        self.performSegue(withIdentifier: "logoutSegue", sender: nil)

        
    }
    
    func getPosts() {
        let query = PFQuery(className: "Post")
        query.order(byDescending: "createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackground { (postsFromDB: [PFObject]?, error: Error?) in
            if let postsFromDB = postsFromDB {
                // do something with the data fetched
                self.finstaPosts = postsFromDB
                self.tableView.reloadData()

            } else {
                // handle error
            }
        }
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let posts = finstaPosts {
            return posts.count;
        } else {
            return 0
        }
        
    }
    
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FinstaPostCell") as! FinstaPostCell
        let finstaPost = finstaPosts?[indexPath.row]
        cell.instagramPost = finstaPost as! PFObject
        
        return cell;
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
