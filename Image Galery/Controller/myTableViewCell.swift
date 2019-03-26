//
//  myTableViewCell.swift
//  Image Galery
//
//  Created by jairo cruz on 3/19/19.
//  Copyright © 2019 jairo cruz. All rights reserved.
//

import UIKit

class myTableViewCell: UITableViewCell {

   
    
    @IBOutlet weak var imageUserView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userProfileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // custom imageProile circle
        userProfileImageView.layer.cornerRadius = userProfileImageView.frame.size.width / 2
        userProfileImageView.clipsToBounds = true
        userProfileImageView.layer.borderColor = UIColor.white.cgColor
        userProfileImageView.layer.borderWidth = 2
        // end custom
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
