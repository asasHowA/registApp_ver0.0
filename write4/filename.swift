//
//  filename.swift
//  write4
//
//  Created by doi-macbook on 2023/01/24.
//

import UIKit

var filename_share:String? = ""

class filename: UIViewController {

    @IBOutlet weak var filename_text: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    
    @IBAction func decide(_ sender: Any) {
        filename_share = filename_text.text
    }
    

}
