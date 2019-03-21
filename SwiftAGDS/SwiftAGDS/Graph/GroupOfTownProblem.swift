//
//  GroupOfTownProblem.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-03-20.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func townProblemOutput(){
    var size = Int(readLine()!)!
    var table = Array<Array<Int>>(repeating: [], count: size)
    for i in 0..<table.count {
        var arr = readLine()!.split(separator: " ").map{Int($0)!}
        for j in 0..<arr.count {
            table[i].append(arr[j])
        }
    }
    var adjList = Array<Array<Array<(Int, Int)>>>(repeating: [], count: size + 1)
    for x in 0..<table.count {
        for y in 0..<table.count {
            if table[x][y] == table[x + 1][y] {
                adjList[x + 1][y + 1].append((x + 2, y + 1))
            }
            if table[x][y] == table[x - 1][y] {
                adjList[x + 1][y + 1].append((x , y + 1))
            }
            if table[x][y] == table[x][y + 1] {
                adjList[x + 1][y + 1].append((x + 1, y + 2))
            }
            if table[x][y] == table[x][y - 1] {
                adjList[x + 1][y + 1].append((x + 1, y))
            }
        }
    }
//    var check = [[Bool]](repeating: false, count: size + 1)
//    var count = 0
//    for i in 1..<adjList.count {
//        for j in 1..<adjList.count{
//            if !check[i][j] {
////                dfs(start: node, checked: &check, adjList: &adjList)
//                count += 1
//            }
//        }
//    }
}
