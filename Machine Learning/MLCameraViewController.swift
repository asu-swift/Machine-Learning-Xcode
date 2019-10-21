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

class MLCameraViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let captureSession = AVCaptureSession()
                   
                   guard let captureDevice = AVCaptureDevice.default(for: .video) else {
                       return
                   }
                   
                   guard let input = try? AVCaptureDeviceInput(device: captureDevice) else {
                       return
                   }
                   
                   captureSession.addInput(input)
                   
                   let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                   view.layer.addSublayer(previewLayer)
                   previewLayer.frame = view.frame
                   

        
        
        }

    
    }
    



