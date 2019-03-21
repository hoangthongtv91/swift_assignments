//
//  BFS.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-03-18.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func bfs(start: Int, checked: inout [Bool], adjList: inout [[Int]]){
    var queue: Queue<Int> = Queue<Int>()
    checked[start] = true
    queue.enqueue(start)
    while !queue.isEmpty {
        let first = queue.dequeue()!
        print(first)
        for v in adjList[first]{
            if checked[v] == false {
                checked[v] = true
                queue.enqueue(v)
            }
        }
    }
}

func storedInAdjacencyListBFS(){
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
    // breadth first search
    var checked: [Bool] = Array<Bool>(repeating: false, count: n + 1)
    bfs(start: 1, checked: &checked, adjList: &adjList)
}
