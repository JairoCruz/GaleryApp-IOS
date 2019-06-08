//
//  ImageDataModel.swift
//  Image Galery
//
//  Created by jairo cruz on 3/27/19.
//  Copyright © 2019 jairo cruz. All rights reserved.
//

import Foundation

class ImageDataModel {
    
    // Declare variable model
    var user: String = ""
    var userImageUrl = ""
    var imageUrl = ""
    
    // Initialization
    init(user: String, userImageUrl: String, imageUrl: String){
        self.user = user
        self.userImageUrl = userImageUrl
        self.imageUrl = imageUrl
    }
}
