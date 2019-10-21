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

    
    
    //I am going to try and use a switch statement for the tools page so we dont have a million view controllers -SS
    
    


    
    //need code for the camera part with overlay features
    
    
    //need code for machine leanring part
    
    
    

}

class tableViewViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var toolTableView: UITableView!
    let data = ["tools"]
    
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


