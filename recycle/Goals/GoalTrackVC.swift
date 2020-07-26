//
//  GoalTrackVC.swift
//  recycle
//
//  Created by Sohom Dutta on 7/21/20.
//  Copyright © 2020 Sohom Dutta. All rights reserved.
//

import UIKit

class GoalTrackVC: UIViewController {

    @IBOutlet weak var itemNumber: UILabel!
    @IBOutlet weak var itemsLeft: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //subtracts 1 from the total count and if result is 0 displays a check mark
    @IBAction func finishGoal(_ sender: Any) {
        if let a = itemsLeft.text{
            if let b = Int(a){
                let c = b - 1
                if c == 0{
                    itemsLeft.text = "✅"
                }else if(c<0){
                    itemsLeft.text = "0"
                }else{
                    itemsLeft.text = "\(c)"
                }

                
            }
        }
    }
    
    //returns to previous view controller
    @IBAction func goHome(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //increments the add goal
    @IBAction func addOne(_ sender: Any) {
        if let a = itemNumber.text{
            if let b = Int(a){
                let c =  b+1;
                itemNumber.text = "\(c)"
            }
        }
    }
    
    //decrements the add goal
    @IBAction func minusOne(_ sender: Any) {
        if let a = itemNumber.text{
            if let b = Int(a){
                let c =  b-1;
                itemNumber.text = "\(c)"
            }
        }
    }
    
    //adds goal to total count
    @IBAction func addGoal(_ sender: Any) {
        if let a = itemNumber.text{
            if let b = Int(a){
                if let c = itemsLeft.text{
                    if let d = Int(c){
                        let e = d+b
                        itemsLeft.text = "\(e)"
                    }
                }
            }
            if a == "✅" {
                if let c = itemsLeft.text{
                    if let d = Int(c){
                        itemsLeft.text = "\(d)"
                    }
                }
            }
        }
    }
    
    //clears the goal
    @IBAction func clearGoal(_ sender: Any) {
        itemsLeft.text = "0"
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
