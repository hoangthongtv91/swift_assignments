//
//  WhoIsMyParent?.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-03-26.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func whoIsMyParent() {
    let firstLine = Int(readLine()!)!
    var array: [[Int]] = []
    var nodesCountArray: [Int] = [Int](repeating: 0, count: firstLine + 1)
    for _ in 0..<firstLine - 1 {
        var nodesInfo = readLine()!.split(separator: " ").map{Int($0)!}
        array.append(nodesInfo)
        nodesCountArray[nodesInfo[0]] += 1
        nodesCountArray[nodesInfo[1]] += 1
    }
    var parent: [Int] = [Int](repeating: 0, count: firstLine + 1)
    var tempArray: [[Int]] = []
    let i = 0
    while !array.isEmpty {
        if array[i][0] == 1 {
            parent[array[i][1]] = 1
        } else if array[i][1] == 1 {
            parent[array[i][0]] = 1
        } else if nodesCountArray[array[i][0]] == 1 {
            parent[array[i][0]] = array[i][1]
        } else if nodesCountArray[array[i][1]] == 1 {
            parent[array[i][1]] = array[i][0]
        } else {
            tempArray.append(array[i])
        }
        array.remove(at: i)
    }
    for i in 0..<tempArray.count {
        if parent[tempArray[i][0]] == 0 {
            parent[tempArray[i][0]] = tempArray[i][1]
        } else {
            parent[tempArray[i][1]] = tempArray[i][0]
        }
    }
    for i in parent[2...] {
        print(i)
    }
}
