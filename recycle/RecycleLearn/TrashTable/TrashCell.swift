//
//  TrashCell.swift
//  recycle
//
//  Created by Sohom Dutta on 7/23/20.
//  Copyright © 2020 Sohom Dutta. All rights reserved.
//

import UIKit

class TrashCell: UITableViewCell {
    
    @IBOutlet weak var theImage: UIImageView!
    
    @IBOutlet weak var theLabel: UILabel!
    
    func configureTrash(trashItem: TrashItem){
        theImage.image = trashItem.image
        theLabel.text = trashItem.description
    }
    
}
