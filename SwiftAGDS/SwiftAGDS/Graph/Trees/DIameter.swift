//
//  DIameter.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-03-27.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func diameter() {
    let firstLine = Int(readLine()!)!
    var adjList: [[(Int,Int)]] = [[(Int,Int)]](repeating: [], count: firstLine + 1)
    for i in 1...firstLine {
        let line = readLine()!.split(separator: " ").map{Int($0)!}
        var j = 1
        while line[j] != -1 {
            adjList[i].append((line[j], line[j + 1]))
            j += 2
        }
    }
    for i in adjList {
        print(i)
    }
    var isVisited: [Bool] = [Bool](repeating: false, count: adjList.count)
    
}
