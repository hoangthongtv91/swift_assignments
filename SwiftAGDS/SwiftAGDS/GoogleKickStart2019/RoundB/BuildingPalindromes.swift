//
//  BuildingPalindromes.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-04-20.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func buildingPalindromes() {
    let firstLine = Int(readLine()!)!
    var i = 0
    while i < firstLine {
        let secondLine = readLine()!.split(separator: " ").map{Int($0)!}
        let charactersArray = readLine()!.map{Character(String($0))}
        var resultCount = 0
        for _ in 0..<secondLine[1] {
            var FLAG = true
            let question = readLine()!.split(separator: " ").map{Int($0)!}
            if question[0] == question[1] {
                resultCount += 1
            } else {
                var d: [Int] = [Int](repeating: 0, count: 26)
                for i in charactersArray[(question[0] - 1)...(question[1] - 1)] {
                    d[i.ascii - 65] += 1
                }
                if (question[1] - question[0]) % 2 != 0 {
                    for i in d {
                        if i % 2 != 0 {
                            FLAG = false
                            break
                        }
                    }
                } else {
                    var count = 0
                    for i in d {
                        if i % 2 != 0 {
                            count += 1
                        }
                    }
                    if count != 1 {
                        FLAG = false
                    }
                }
                if FLAG == true {
                    resultCount += 1
                }
            }
        }
        print("Case #\(i + 1): \(resultCount)")
        i += 1
    }
}
