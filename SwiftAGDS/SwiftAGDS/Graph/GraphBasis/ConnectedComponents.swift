//
//  ConnectedComponents.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-03-19.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func ConnectedComponents() {
    let firstLine = readLine()!.split(separator: " ")
    let n = Int(firstLine[0])! // num of vertices
    let m = Int(firstLine[1])! // num of edges
    var adjList = Array<Array<Int>>(repeating: [], count: n + 1)
    
    for _ in 0..<m {
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        adjList[u].append(v) // undirected u -> v, v -> u
        adjList[v].append(u)
    }
    
    // dfs (depth first search)
    var check: [Bool] = Array<Bool>(repeating: false, count: n + 1)
    var count = 0
    for node in 1..<adjList.count {
        if !check[node] {
            dfs(start: node, checked: &check, adjList: &adjList) // 1 -> 2 -> 3 -> 4 -> 5 -> 6
            count += 1
        }
    }
    print("components: \(count)")
}
