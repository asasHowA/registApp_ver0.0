//
//  input.swift
//  write4
//
//  Created by doi-macbook on 2023/01/23.
//

import UIKit

var _touroku1:String? = ""
var _touroku2:String? = ""
var _touroku3:String? = ""

class input: UIViewController {
    
    @IBOutlet weak var touroku1: UITextField!
    @IBOutlet weak var touroku2: UITextField!
    @IBOutlet weak var touroku3: UITextField!
    @IBOutlet weak var x_zahyou: UILabel!
    @IBOutlet weak var y_zahyou: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       navigationController?.isNavigationBarHidden = false
     }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        x_zahyou.text = "x:" + String(tap_x)
        y_zahyou.text = "y:" + String(tap_y)
        print(tap_x,tap_y)
        touroku1.placeholder = "登録情報１を入力してください"
        touroku2.placeholder = "登録情報２を入力してください"
        touroku3.placeholder = "登録情報３を入力してください!"
        //push
        // Do any additional setup after loading the view.
    }
    
    @IBAction func decision(_ sender: Any) {
        _touroku1 = touroku1.text
        _touroku2 = touroku2.text
        _touroku3 = touroku3.text

        out_put.append([String(tap_x),String(tap_y),_touroku1!,_touroku2!,_touroku3!])
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

