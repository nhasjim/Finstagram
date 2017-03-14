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
    @IBOutlet weak var caption: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    
    var instagramPost: PFObject! { //PFObject we will give to each table cell
        didSet {
            //now that we have the PFObject, we can do things specifically in it
            self.finstaPic.file = instagramPost["media"] as? PFFile
            self.finstaPic.loadInBackground()
            self.caption.text = instagramPost["caption"] as? String
        }
    }
    var liked = false;
    @IBAction func onLike(_ sender: Any) {
        if (liked == false){
            let pressed = UIImage(named: "heartfilled")
            likeButton.setImage(pressed, for: UIControlState.normal)
            liked = true;
        }
        else {
            let pressed = UIImage(named: "heart")
            likeButton.setImage(pressed, for: UIControlState.normal)
            liked = false;
        }

    }
    
    @IBAction func onComment(_ sender: Any) {
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
