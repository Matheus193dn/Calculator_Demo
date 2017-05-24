//
//  TableViewCell.swift
//  InstagramClone
//
//  Created by Minh Hoang Nguyen on 5/23/17.
//  Copyright © 2017 iossimple. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var userpostedImage: UIImageView!
    @IBOutlet weak var totalLikes: UILabel!
    
    @IBAction func likeButton(_ sender: UIButton) {
        
    }
    
    @IBAction func commentButton(_ sender: UIButton) {
        
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
