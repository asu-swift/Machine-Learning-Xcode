//
//  MLCamera.swift
//  Machine Learning
//
//  Created by Timothy Arquitt on 10/21/19.
//  Copyright © 2019 The Apple Fritters. All rights reserved.
//

import UIKit
import AVKit

class MLCamera: UIView {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    

    let captureSession = AVCaptureSession()
    
    guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
    guard let input = try? AVCaptureDeviceInput(device: captureDevice)else { return }
    
    captureSession.addInput(input)
    
    }
}
