//
//  Get.swift
//  Finstagram
//
//  Created by Nick Hasjim on 3/12/17.
//  Copyright © 2017 Nick Hasjim. All rights reserved.
//

import UIKit
import Parse


class Get: NSObject {
    // construct PFQuery

    class func getAllPics(){
        let query = PFQuery(className: "Post")
        query.order(byDescending: "createdAt")
        query.includeKey("author")
        query.limit = 20

        // fetch data asynchronously
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let posts = posts {
                // do something with the data fetched
            } else {
                // handle error
            }
        }
    }
    
    
}
