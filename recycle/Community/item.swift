//
//  item.swift
//  recycle
//
//  Created by Sohom Dutta on 7/21/20.
//  Copyright © 2020 Sohom Dutta. All rights reserved.
//

import Foundation
import UIKit

class item{
    var image: UIImage
    var title: String
    var contact: String
    
    init(image: UIImage, title: String, contact: String){
        self.image = image
        self.title = title
        self.contact = contact
    }
}
