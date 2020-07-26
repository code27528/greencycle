//
//  post.swift
//  recycle
//
//  Created by Sohom Dutta on 7/22/20.
//  Copyright © 2020 Sohom Dutta. All rights reserved.
//

import Foundation
import UIKit

class post{
    var image: UIImage
    var description: String
    var contactInfo: String
    
    init(image: UIImage, description: String, contactInfo: String){
        self.image = image
        self.description = description
        self.contactInfo = contactInfo
    }
}
