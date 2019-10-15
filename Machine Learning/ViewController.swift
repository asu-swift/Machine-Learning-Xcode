//
//  ViewController.swift
//  Machine Learning
//
//  Created by Sabrina Sturtevant on 10/9/19.
//  Copyright © 2019 The Apple Fritters. All rights reserved.
//

import UIKit 

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
        
        
        

    
    
    @IBOutlet weak var photoImageOutlet: UIImageView!
    
    
    

    @IBOutlet weak var scrollView: UIScrollView!

    @IBAction func photoLibraryTapped(_ sender: Any) {
        //code for photo library
            let imagePickerController = UIImagePickerController()
             imagePickerController.delegate = self
                
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
            
        
    }
    
    @IBAction func generalSafetyTapped(_ sender: Any) {
        
        let contentwidth = scrollView!.bounds.width
        let contentHeight = scrollView.bounds.height
        scrollView.contentSize = CGSize(width: contentwidth, height: contentHeight)
        

        view.addSubview(scrollView)
        
    }
    
    
    
       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       
           let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
           
           photoImageOutlet.image = image
           
           picker.dismiss(animated: true, completion: nil)
       }

    
    
    


    
    //need code for the camera part with overlay features
    
    
    //need code for machine leanring part
    
    
    //need search bar code
    
    
    

}

