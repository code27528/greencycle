//
//  PostCell.swift
//  recycle
//
//  Created by Sohom Dutta on 7/22/20.
//  Copyright © 2020 Sohom Dutta. All rights reserved.
//

import UIKit
protocol PostCellDelegate: AnyObject{
    func didTapButton(with owner: String, with description: String)
}

class PostCell: UITableViewCell {
    
    weak var delegate: PostCellDelegate?

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postDescription: UILabel!
    @IBOutlet weak var postContact: UILabel!
    
    @IBOutlet weak var contactButton: UIButton!
    
    @IBAction func contactPressed(_ sender: Any) {
        if let texter = postContact.text{
            if let describer = postDescription.text{
                delegate?.didTapButton(with: texter, with: describer)
            }
        }
        
    }
    
    
    func configurePost(post: post, owner: String){
        postImage.image = post.image
        postDescription.text = post.description
        postContact.text = post.contactInfo
    }
}

