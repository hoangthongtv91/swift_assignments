//
//  SystemFileCrawler.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-03-12.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation
func printSystemFileCrawler(_ currentPath: String,_ number: inout Int,_ numberOfFiles: inout Int,_ prefix: String = ""){
    let fileManager = FileManager.default
    var isDirec = ObjCBool(false)
    if fileManager.fileExists(atPath: currentPath, isDirectory: &isDirec) && isDirec.boolValue{
        do{
            let contains = try fileManager.contentsOfDirectory(atPath: currentPath)
            number += contains.count
            for i in contains{
                if i == contains[contains.count - 1]{
                    print("\(prefix)└─ \(i)")
                    printSystemFileCrawler(currentPath + "/\(i)", &number, &numberOfFiles, prefix + "    ")
                }else{
                    print("\(prefix)├─ \(i)")
                    printSystemFileCrawler(currentPath + "/\(i)", &number, &numberOfFiles, prefix + "|    ")
                }
            }
        }catch{
            print("Error")
        }
    }else{
        numberOfFiles += 1
    }
}
