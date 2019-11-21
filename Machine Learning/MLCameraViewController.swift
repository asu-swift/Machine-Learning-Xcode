//
//  MLCameraViewController.swift
//  Machine Learning
//
//  Created by Timothy Arquitt on 10/21/19.
//  Copyright © 2019 The Apple Fritters. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import CoreML
import Vision


class MLCameraViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate{

    let mlCamLable: UILabel = {
        let lable = UILabel()
        lable.backgroundColor = .white
        lable.textAlignment = .center
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let captureSession = AVCaptureSession()
        
        captureSession.sessionPreset = .photo
                   
                   guard let captureDevice = AVCaptureDevice.default(for: .video) else {
                       return
                   }
                   
                   guard let input = try? AVCaptureDeviceInput(device: captureDevice) else {return}
                   
                   captureSession.addInput(input)
        
        captureSession.startRunning()
                   
                   let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                   
        view.layer.addSublayer(previewLayer)
                   previewLayer.frame = view.frame
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(dataOutput)
                   

        
        
        
        }
    
    func captureOutput( output:AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection){
        print("Testing capture", Date())
    
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
       
        
        guard let model = try? VNCoreMLModel(for: ImageClassifier().model) else { return }
        
        
        let request = VNCoreMLRequest(model: model)
        {
            (finishedReq, err) in
        //check err
            //print(finishedReq.results)
            
            guard let results = finishedReq.results as? [VNClassificationObservation]
                else {return}
            
            guard let firstObservation = results.first else {return}
            
            DispatchQueue.main.async {
                self.mlCamLable.text = "\(firstObservation.identifier) \(firstObservation.confidence * 100)"
                
            }
            
            
            }

        
        try? VNImageRequestHandler(cvPixelBuffer:pixelBuffer, options: [:]).perform([request])
    
        
    }

    
    }
    



