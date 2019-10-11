//
//  ViewController.swift
//  Machine Learning
//
//  Created by Sabrina Sturtevant on 10/9/19.
//  Copyright © 2019 The Apple Fritters. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }
    

    @IBOutlet weak var scrollView: UIScrollView!


    @IBAction func generalSafetyTapped(_ sender: Any) {
        
        let contentwidth = scrollView.bounds.width
        let contentHeight = scrollView.bounds.height
        scrollView.contentSize = CGSize(width: contentwidth, height: contentHeight)
        

        view.addSubview(scrollView)
        
    }
    
   // let contentWidth = scrollView.bounds.width
  //  let contentHeight = scrollView.bounds.height * 3
   // scrollView.contentSize = CGSize(width: contentWidth, height: contentHeight)
    
    
    
    



}

