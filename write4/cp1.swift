//
//  cp1.swift
//  write4
//
//  Created by doi-macbook on 2023/01/21.
//

import UIKit
import UniformTypeIdentifiers
import Foundation
import AVFoundation

var xcp1:String = ""
var ycp1:String = ""
var xcp2:String = ""
var ycp2:String = ""

var out_put:[[String]] = [["title",""],["説明",""],["補正点1"],["補正点2"],["x","y","半径"]]

class cp1: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    //    naviステ隠し
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       navigationController?.isNavigationBarHidden = false
     }
    override var prefersStatusBarHidden: Bool {
        return true
    }
        
    var synthesizer: AVSpeechSynthesizer!
    var voice: AVSpeechSynthesisVoice!
    
    var xEndedTaplist: [Double] = []
    var yEndedTaplist: [Double] = []
    var tapxy:String = ""
    var xkiroku:[Double] = []
    var ykiroku:[Double] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.isMultipleTouchEnabled = true;
        
//        ViewController2.documentPicker(ViewController2)
        showImage(imageView: image, url: urlB)
        
        let st = UITapGestureRecognizer(target: self, action: #selector(screenTransition(_:)))
        st.numberOfTouchesRequired = 2
        st.numberOfTouchesRequired = 2
        view.addGestureRecognizer(st)
        
    }
    
    func showImage(imageView: UIImageView, url: URL) {
            do {
                let data = try Data(contentsOf: url)
                let image = UIImage(data: data)
                imageView.image = image
            } catch let err {
                print("Error: \(err.localizedDescription)")
            }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("離れた")
        for touch in touches {
            let location = touch.location(in: self.view)
            xEndedTaplist.append(location.x)
            yEndedTaplist.append(location.y)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.xEndedTaplist.removeFirst()
                self.yEndedTaplist.removeFirst()
            }
        }
        
        if xEndedTaplist.count >= 2{
            print("配列要素数",xEndedTaplist.count)
            for i in 0...xEndedTaplist.count-2{
                let d = sqrt(pow((xEndedTaplist[i]-(xEndedTaplist.last)!),2)+pow((yEndedTaplist[i]-(yEndedTaplist.last)!),2))
                //print(d)
                if d <= 10.39{
                    print("double tap:",d)
                    tapxy = "エックス" + String(xEndedTaplist[i]) + "ワイ" + String(yEndedTaplist[i])
//                    xkiroku.append(xEndedTaplist[i])
//                    ykiroku.append(yEndedTaplist[i])
                    xcp1 = String(xEndedTaplist[i])
                    ycp1 = String(yEndedTaplist[i])
                    print(type(of: xcp1))
                    print("xcp1:",xcp1,"ycp1",ycp1)
                }
                break
            }
            
        }else{
            print("配列要素数1")
        }
        print("====")
    }
        
//    次の画面
    @IBAction func screenTransition(_ gesture: UILongPressGestureRecognizer){
        print("doubletap_doubletouch")

        performSegue(withIdentifier: "tocp2", sender: nil)
    }

//    値渡し（グローバル変数を利用するため消した方がいいかも）
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toAdjust2" {
//            let nextview = segue.destination as! Adjust2Controller
//            if let xkiroku:Double = xkiroku.last, let ykiroku:Double = ykiroku.last{
//                nextview.xTap1 = xkiroku
//                nextview.yTap1 = ykiroku
//            }else{
//                print("nil error")
//            }
//        }
//    }
}


