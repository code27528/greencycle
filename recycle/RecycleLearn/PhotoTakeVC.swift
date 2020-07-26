//
//  PhotoTakeVC.swift
//  recycle
//
//  Created by Sohom Dutta on 7/20/20.
//  Copyright © 2020 Sohom Dutta. All rights reserved.
//

import UIKit
import AVFoundation
import Vision

class PhotoTakeVC: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate{
    let identifierLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.backgroundColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let recycle = ["newspaper", "magazine", "envelope", "book", "notebook", "poster", "cardboard box", "water bottle", "paper", "cereal box", "phonebook", "can", "sticky notes", "wrapping paper", "cartons"]
    let compost = ["bread", "grains", "pasta", "coffee ground", "tea bags", "dairy", "eggs", "fruit", "vegetables", "meat", "flowers", "grass", "leaves", "tree trimmings", "coffee filters", "wood", "bags", "guacomole", "custard apple", "cucumber", "cuke"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let captureSession = AVCaptureSession()
        captureSession.sessionPreset = .photo
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        captureSession.addInput(input)
        
        captureSession.startRunning()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(dataOutput)
        
        setupIdentifierConfidenceLabel()
    }
    
    fileprivate func setupIdentifierConfidenceLabel() {
        view.addSubview(identifierLabel)
        identifierLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32).isActive = true
        identifierLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        identifierLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        identifierLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        guard let model = try? VNCoreMLModel(for:  ItemBinClassifier().model) else { return }
        let request = VNCoreMLRequest(model: model) { (finishedReq, err) in
            
            guard let results = finishedReq.results as? [VNClassificationObservation] else { return }
            
            guard let firstObservation = results.first else { return }
            
            print(firstObservation.identifier, firstObservation.confidence)
            
            
            DispatchQueue.main.async {
                if firstObservation.identifier == "Recycle"{
                    if firstObservation.confidence > 0.985{
                        self.identifierLabel.text = "\(firstObservation.identifier)"
                    }
                }else if(firstObservation.identifier == "Compost"){
                    if firstObservation.confidence > 0.9{
                        self.identifierLabel.text = "Compost"
                    }
                }else{
                    self.identifierLabel.text = "Neither"
                }
                //self.identifierLabel.text = "\(firstObservation.identifier)"                //self.identifierLabel.text = "\(firstObservation.identifier) \(firstObservation.confidence * 100)"
            }
            
        }
        
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }

}
