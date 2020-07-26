//
//  ConversionVC.swift
//  recycle
//
//  Created by Sohom Dutta on 7/20/20.
//  Copyright © 2020 Sohom Dutta. All rights reserved.
//

import UIKit

class ConversionVC: UIViewController {

    @IBOutlet weak var underNumber: BottleTextField!
    
    @IBOutlet weak var overNumber: BottleTextField!
    
    @IBOutlet weak var outputLbl: UILabel!
    
    @IBOutlet weak var dollarsLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let calcButton = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        calcButton.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        calcButton.setTitle("Calculate", for: .normal)
        calcButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        calcButton.addTarget(self, action: #selector(ConversionVC.calculate), for: .touchUpInside)
        
        underNumber.inputAccessoryView = calcButton
        overNumber.inputAccessoryView = calcButton
        
        outputLbl.isHidden = true
        dollarsLbl.isHidden = true
        
    }
    
    @objc func calculate(){
        if let overNumber = overNumber.text, let underNumber = underNumber.text{
            if let over = Double(overNumber), let under = Double(underNumber){
                outputLbl.isHidden=false
                dollarsLbl.isHidden=false
                outputLbl.text = "\(Money.calculateAmount(forUnder: under, andOver: over))"
                view.endEditing(true)
            }
        }
    }
    
    @IBAction func goBackToMain(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clearAll(_ sender: Any) {
        outputLbl.isHidden = true
        underNumber.text = ""
        overNumber.text = ""
        dollarsLbl.isHidden = true
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
