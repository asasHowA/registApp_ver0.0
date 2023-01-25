//
//  regist.swift
//  write4
//
//  Created by doi-macbook on 2023/01/23.
//

import UIKit

var regsitButtonItem: UIBarButtonItem!

var tap_x:Double = 0.0
var tap_y:Double = 0.0


class regist: UIViewController {

    
    @IBOutlet weak var image: UIImageView!
    
    //    naviステ隠し
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
        let drawView = DrawView(frame: self.view.bounds)
        self.view.addSubview(drawView)
        print("jikkou-1")
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    var xEndedTaplist: [Double] = []
    var yEndedTaplist: [Double] = []
    var tapxy:String = ""
    var xkiroku:[Double] = []
    var ykiroku:[Double] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.isMultipleTouchEnabled = true;
        regsitButtonItem = UIBarButtonItem(title: "学習データを保存する", style: .done, target: self, action: #selector(registButtonPressed(_:)))
        self.navigationItem.rightBarButtonItem = regsitButtonItem


        showImage(imageView: image, url: urlB)


        let st = UITapGestureRecognizer(target: self, action: #selector(screenTransition(_:)))
        st.numberOfTouchesRequired = 2
        st.numberOfTouchesRequired = 2
        view.addGestureRecognizer(st)
        
        print("======",out_put)
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
    
    @objc func registButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "tolast", sender: nil)
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
                    tap_x = xEndedTaplist[i]
                    tap_y = yEndedTaplist[i]
                    performSegue(withIdentifier: "toInput", sender: nil)

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
        performSegue(withIdentifier: "toInput", sender: nil)
    }
}



