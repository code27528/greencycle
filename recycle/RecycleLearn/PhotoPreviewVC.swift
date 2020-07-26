//
//  PhotoPreviewVC.swift
//  recycle
//
//  Created by Sohom Dutta on 7/20/20.
//  Copyright © 2020 Sohom Dutta. All rights reserved.
//

import UIKit

class PhotoPreviewVC: UIViewController {

    @IBAction func goToHomeFromPhoto(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goToCamera(_ sender: Any) {
        performSegue(withIdentifier: "goToVideo", sender: self)
    }
    @IBAction func goToBinCamera(_ sender: Any) {
        performSegue(withIdentifier: "binSegue", sender: self)
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
