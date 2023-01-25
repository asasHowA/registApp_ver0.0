//
//  ViewController2.swift
//  write4
//
//  Created by doi-macbook on 2023/01/19.
//

import UIKit
import UniformTypeIdentifiers
import Foundation

var urlB:URL = URL(string: "a")!

class ViewController2: UIViewController{
    
    func showFilePicker() {

        let picker = UIDocumentPickerViewController(
            forOpeningContentTypes: [
                UTType.jpeg,
                UTType.png,
                UTType.pdf
            ],
            asCopy: true)
        picker.delegate = self
        self.navigationController?.present(picker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showFilePicker()
    }
}

extension ViewController2: UIDocumentPickerDelegate {

    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        // ファイル選択後に呼ばれる
        // urls.first?.pathExtensionで選択した拡張子が取得できる

//        if let filePath = urls.first?.description {
//            print("ファイルパス:\(filePath)")
//        }
        guard let urlA = urls.first else { return }
        guard urlA.startAccessingSecurityScopedResource() else {
            // ここで選択したURLでファイルを処理する
            print(type(of: urls.first))
            urlB = urlA
            print("urlA:",urlA)
            print("urlB:",urlB)
//            showImage(imageView: image, url: urlA)
            performSegue(withIdentifier: "tocp1", sender: nil)
            return
        }
        // ファイルの処理が終わったら、セキュリティで保護されたリソースを解放(されてないっぽい)
        do { urlA.stopAccessingSecurityScopedResource() }
    }

    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("ファイル取得キャンセル")
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
}
