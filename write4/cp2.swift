//
//  cp2.swift
//  write4
//
//  Created by doi-macbook on 2023/01/23.
//

import UIKit
import UniformTypeIdentifiers
import Foundation
import AVFoundation

class cp2: UIViewController {
    
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
        
        synthesizer = AVSpeechSynthesizer()
        voice = AVSpeechSynthesisVoice.init(language: "ja-JP")
        
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
                    xcp2 = String(xEndedTaplist[i])
                    ycp2 = String(yEndedTaplist[i])
                    print("xcp2:",xcp2,"ycp2",ycp2)
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
        performSegue(withIdentifier: "toreg", sender: nil)
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

