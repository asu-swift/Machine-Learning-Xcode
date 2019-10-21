//
//  ViewController.swift
//  Machine Learning
//
//  Created by Sabrina Sturtevant on 10/9/19.
//  Copyright © 2019 The Apple Fritters. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }
        
        
    @IBOutlet weak var toolLabel: UILabel!
    
    @IBOutlet weak var toolPicture: UIImageView!
    
    @IBOutlet weak var toolDescription: UITextView!
    
    
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
        
        
        

        
    }
    
    
    
       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       
           let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
           
           photoImageOutlet.image = image
           
           picker.dismiss(animated: true, completion: nil)
       }

    
        
    @IBAction func tableSawTapped(_ sender: Any) {
        toolLabel.text = "Table Saw"
        toolPicture.image = UIImage(named: "tableSaw")
      ///  toolDescription =
      ///  """
       /// The table saw is a variation of a cabinet saw, and is generally used to cut large panels and sheet goods such as plywood. Sliding table saws have a sliding table on the left side of the  blade typically usually on a folding arm mounted underneth the table saw and is used for cross cutting and ripping larger materials.
///"""
    }
    
    
    
    //need code for the camera part with overlay features
    
    
    //need code for machine leanring part
    
    //we need to get our fonts in here or we need to make all our labels in xd and export them
    

}

class tableViewViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var toolTableView: UITableView!
    let data = ["table saw"]
    
    var filteredData: [String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toolTableView.dataSource = self
        searchBar.delegate = self
        filteredData = data
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "toolTableViewCell")
        let holderText = data[indexPath.row]
        myCell?.textLabel?.text = holderText
        return myCell!
    }
    
    func searchBar (_searchBar: UISearchBar, textDidChange searchText: String)
    {
        filteredData = searchText.isEmpty ? data : data.filter{(item: String) -> Bool in return item.range(of: searchText, options: .caseInsensitive, range:nil, locale: nil) != nil}
    }
}






