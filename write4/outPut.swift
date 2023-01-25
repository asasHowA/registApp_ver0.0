//
//  outPut.swift
//  write4
//
//  Created by doi-macbook on 2023/01/23.
//

import UIKit
let groupID = "group.readwrite3"
let url = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: groupID)
let url2 = url!.path + "/sampledir"

class outPut: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        var sample:[[String]] = [["1","なかだ"],["2","どい"],["3","冨樫"],["4","井上"]]
        var fileStrData:String = ""
        let url3 = url2 + "/sample11"
        
        out_put[2].insert(xcp1, at: 1)
        out_put[2].insert(ycp1, at: 2)
        out_put[3].insert(xcp2, at: 1)
        out_put[3].insert(ycp2, at: 2)

//        print("=====")
//        print(url!.path)
//        print(NSHomeDirectory())
       
        
        for singleArray in out_put{
            for singleString in singleArray{
                fileStrData += "\"" + singleString + "\""
                if singleString != singleArray[singleArray.count-1]{
                    fileStrData += ","
                }
            }
            fileStrData += "\n"
        }
        let data:Data = fileStrData.data(using: .utf8)!
        print(fileStrData)
        print(data)
        
//        do {
//            try FileManager.default.createFile(atPath: url!.path, contents: data)
//        }catch{
//            print("error")
//        }
        
        do {
            try FileManager.default.createDirectory(atPath: url2, withIntermediateDirectories: false)
        }catch{
            print("error")
        }
        
//        do {
//            try FileManager.default.createFile(atPath: url3, contents: data)
//        }catch{
//            print("error")
//        }
//
//        FileManager.default.createFile(atPath: convertPath(path), contents: <#T##Data?#>, attributes: <#T##[FileAttributeKey : Any]?#>)
    }
    
    
}

