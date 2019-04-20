//
//  IsGraphBipartite.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-04-12.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func isBipartiteHelper(start: Int, color: Int, check: inout [Int], adjList: inout [[Int]]) {
    check[start] = color
    for next in adjList[start] {
        if check[next] == 0 {
            depthfs(start: next, color: 3-color, check: &check, adjList: &adjList)
        }
    }
}

func isBipartite(_ graph: [[Int]]) -> Bool {
    var graph = graph
    var check: [Int] = Array<Int>(repeating: 0, count: graph.count)
    for v in 0..<graph.count {
        if check[v] == 0 {
            depthfs(start: v, color: 1, check: &check, adjList: &graph)
        }
    }
    // all nodes are colored
    var FLAG = false
    for i in 0..<graph.count {
        for j in 0..<graph[i].count {
            let next = graph[i][j]
            if check[i] == check[next] {
                FLAG = true
                break
            }
        }
    }
    return FLAG ? false : true
}
