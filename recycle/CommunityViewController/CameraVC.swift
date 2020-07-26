//
//  CameraVC.swift
//  recycle
//
//  Created by Sohom Dutta on 7/22/20.
//  Copyright © 2020 Sohom Dutta. All rights reserved.
//

import UIKit
import AVFoundation

class CameraVC: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, AVCaptureVideoDataOutputSampleBufferDelegate, AVCapturePhotoCaptureDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        performSegue(withIdentifier: "secondSegue", sender: self)
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
