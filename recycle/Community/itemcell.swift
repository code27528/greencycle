//
//  itemcell.swift
//  recycle
//
//  Created by Sohom Dutta on 7/21/20.
//  Copyright © 2020 Sohom Dutta. All rights reserved.
//

import UIKit

class itemcell: UITableViewCell {
    
    @IBOutlet weak var itemPhoto: UIImageView!
    
    @IBOutlet weak var itemDescription: UILabel!
    
    @IBOutlet weak var contactinfo: UILabel!
    
    func setItem(item: item){
        itemPhoto.image = item.image
        itemDescription.text = item.title
        contactinfo.text = item.contact
    }
    
}
