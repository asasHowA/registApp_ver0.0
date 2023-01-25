//
//  ViewController.swift
//  write4
//
//  Created by doi-macbook on 2023/01/17.
//
//
//import UIKit
//let groupID = "group.readwrite3"
//let url = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: groupID)
//let url2 = url!.path + "/sampledir"
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        var sample:[[String]] = [["1","なかだ"],["2","どい"],["3","冨樫"],["4","井上"]]
//        var fileStrData:String = ""
//        let url3 = url2 + "/sample11"
////        print("=====")
////        print(url!.path)
////        print(NSHomeDirectory())
//       
//        
//        for singleArray in sample{
//            for singleString in singleArray{
//                fileStrData += "\"" + singleString + "\""
//                if singleString != singleArray[singleArray.count-1]{
//                    fileStrData += ","
//                }
//            }
//            fileStrData += "\n"
//        }
//        let data:Data = fileStrData.data(using: .utf8)!
//        print(fileStrData)
//        print(data)
//        
//        var sample2:[[String]] = [["1","なかだ"],["2","どい"],["3","冨樫"],["4","井上"],["5","佐藤"]]
//        var fileStrData2:String = ""
//        for singleArray2 in sample2{
//            for singleString2 in singleArray2{
//                fileStrData2 += "\"" + singleString2 + "\""
//                if singleString2 != singleArray2[singleArray2.count-1]{
//                    fileStrData2 += ","
//                }
//            }
//            fileStrData2 += "\n"
//        }
//        let data2:Data = fileStrData2.data(using: .utf8)!
//        print(fileStrData2)
//        print(data2)
//        
////        do {
////            try FileManager.default.createFile(atPath: url!.path, contents: data)
////        }catch{
////            print("error")
////        }
//        
//        do {
//            try FileManager.default.createDirectory(atPath: url2, withIntermediateDirectories: false)
//        }catch{
//            print("error")
//        }
//        
//        do {
//            try FileManager.default.createFile(atPath: url3, contents: data)
//        }catch{
//            print("error")
//        }
//        do {
//            try FileManager.default.createFile(atPath: url2+"/sample12", contents: data2)
//        }catch{
//            print("error")
//        }
//        
////        FileManager.default.createFile(atPath: convertPath(path), contents: <#T##Data?#>, attributes: <#T##[FileAttributeKey : Any]?#>)
//    }
//}

