//
//  DFS.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-03-18.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation
func dfs(start: Int, checked: inout [Bool], adjList: inout [[Int]]){
    checked[start] = true
    print(start)
    for next in adjList[start]{
        if checked[next] == false{
            dfs(start: next, checked: &checked, adjList: &adjList)
        }
    }
}

func storedInAdjacencyList(){
    let firstLine = readLine()!.split(separator: " ")
    let n = Int(firstLine[0])! // num of vertices
    let m = Int(firstLine[1])! // num of edges
    var adjList = Array<Array<Int>>(repeating: [], count: n + 1)
    for _ in 0..<m{
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        adjList[u].append(v) // undirected u -> v, v -> u
        adjList[v].append(u)
    }
    // dept first search
    var checked: [Bool] = Array<Bool>(repeating: false, count: n + 1)
    dfs(start: 1, checked: &checked, adjList: &adjList)
}

