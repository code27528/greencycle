//
//  AddPostVC.swift
//  recycle
//
//  Created by Sohom Dutta on 7/22/20.
//  Copyright © 2020 Sohom Dutta. All rights reserved.
//

import UIKit
import AVFoundation

/*protocol AddContactDelegate{
    func addItem(contact: Contact, description: Description, image: itemImage)
}*/


class AddPostVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextViewDelegate {
    
    //var delegateItem: AddContactDelegate?

    
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var contactTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var createButton: UIButton!
    
    var takenPhoto: UIImage?
    var callback : ((String) -> Void)?
    var fallback : ((String) -> Void)?
    var ballback : ((UIImage) -> Void)?
    
    @IBAction func addImage(_ sender: AnyObject) {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerController.SourceType.camera
        
        image.allowsEditing = false
        
        self.present(image, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imageView.image = image
        }else{
            
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.descriptionTextView.layer.borderColor = UIColor.black.cgColor
        self.descriptionTextView.layer.borderWidth = 1
        self.contactTextView.layer.borderColor = UIColor.black.cgColor
        self.contactTextView.layer.borderWidth = 1
        descriptionTextView.text = "Enter a description of the item"
        descriptionTextView.textColor = UIColor.lightGray
        contactTextView.text = "Enter contact info"
        contactTextView.textColor = UIColor.lightGray
        descriptionTextView.delegate = self
        contactTextView.delegate = self
        
        
        if let availableImage = takenPhoto{
            imageView.image = availableImage
        }
        // Do any additional setup after loading the view.
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
       /* if textView.text.isEmpty {
            textView.text = "Enter information here"
            textView.textColor = UIColor.lightGray
        }*/
    }
    
    
    @IBAction func goBackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func createPressed(_ sender: Any) {
        /*guard let contactInformation = contactTextView.text else{return}
        guard let descriptionInformation = descriptionTextView.text else{return}
        guard let imageInformation = imageView.image else{return}
        
        let contact = Contact(contactInfo: contactInformation)
        let describe = Description(itemDescribe: descriptionInformation)
        let imager = itemImage(imageForItem: imageInformation)
        delegateItem?.addItem(contact: contact, description: describe, image: imager)*/
        
        //performSegue(withIdentifier: "returnSegue", sender: self)
        callback?(descriptionTextView.text)
        fallback?(contactTextView.text)
        ballback?(imageView.image!)
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    
}
