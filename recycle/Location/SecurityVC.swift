//
//  SecurityVC.swift
//  recycle
//
//  Created by Sohom Dutta on 7/24/20.
//  Copyright © 2020 Sohom Dutta. All rights reserved.
//

import UIKit

class SecurityVC: UIViewController {
    @IBOutlet weak var firstTextField: UITextView!
    @IBOutlet weak var secondTextField: UITextView!
    @IBOutlet weak var thirdTextField: UITextView!
    @IBOutlet weak var fourthTextField: UITextView!
    
    public var coordinate: [customIn] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstTextField.keyboardType = UIKeyboardType.numberPad
        secondTextField.keyboardType = UIKeyboardType.numberPad
        thirdTextField.keyboardType = UIKeyboardType.numberPad
        fourthTextField.keyboardType = UIKeyboardType.numberPad
        firstTextField.layer.borderWidth = 1
        secondTextField.layer.borderWidth = 1
        thirdTextField.layer.borderWidth = 1
        fourthTextField.layer.borderWidth = 1
        
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is RouteVC{
            let vc = segue.destination as? RouteVC
            vc?.coordinater = coordinate
        }
    }
    
    @IBAction func checkPressed(_ sender: Any) {
        var apple = true
        if firstTextField.text == "1"{
            if secondTextField.text == "2"{
                if thirdTextField.text == "3"{
                    if fourthTextField.text == "4"{
                        apple = false
                        performSegue(withIdentifier: "routeSegue", sender: self)
                    }
                }
            }
        }
        if apple {
            let alert = UIAlertController(title: "The password is incorrect", message: "Please try again", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
