//
//  CompostCell.swift
//  recycle
//
//  Created by Sohom Dutta on 7/23/20.
//  Copyright © 2020 Sohom Dutta. All rights reserved.
//

import UIKit

class CompostCell: UITableViewCell {
    @IBOutlet weak var theImage: UIImageView!
    
    @IBOutlet weak var theLabel: UILabel!
    func configureCompost(compostItem: CompostItem){
        theImage.image = compostItem.image
        theLabel.text = compostItem.description
    }
}
