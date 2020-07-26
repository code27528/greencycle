//
//  RecycleCell.swift
//  recycle
//
//  Created by Sohom Dutta on 7/23/20.
//  Copyright © 2020 Sohom Dutta. All rights reserved.
//

import UIKit

class RecycleCell: UITableViewCell {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    func configureRecycle(recycleItem: RecycleItem){
        myImage.image = recycleItem.image
        myLabel.text = recycleItem.description
    }
}
