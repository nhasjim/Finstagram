//
//  FinstaPostCell.swift
//  Finstagram
//
//  Created by Nick Hasjim on 3/12/17.
//  Copyright © 2017 Nick Hasjim. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class FinstaPostCell: UITableViewCell {

    @IBOutlet weak var finstaPic: PFImageView!
    var instagramPost: PFObject! { //PFObject we will give to each table cell
        didSet {
            //now that we have the PFObject, we can do things specifically in it
            print("instagram post3")

            print(instagramPost.debugDescription)
            self.finstaPic.file = instagramPost["media"] as? PFFile
            self.finstaPic.loadInBackground()
        }
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
