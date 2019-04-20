//
//  AdjacencyList.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-03-18.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation
func AdjacencyList(){
    let NUM_VERTICES = 1000
    let firstLine = readLine()!.split(separator: " ")
    let _ = Int(firstLine[0])!
    let m = Int(firstLine[1])!
    var adjList = Array<Array<Int>>(repeating: [], count: NUM_VERTICES + 1)
    for _ in 0..<m{
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        adjList[u].append(v)
        adjList[v].append(u)
    }
    print(adjList)
}

func AdjacencyListWeighted(){
    let firstLine = readLine()!.split(separator: " ")
    let n = Int(firstLine[0])!
    let m = Int(firstLine[1])!
    var adjList = Array<Array<(Int, Int)>>(repeating: [], count: n + 1)
    for _ in 0..<m{
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        let w = Int(edge[2])!
        adjList[u].append((v, w))
        adjList[v].append((u, w))
    }
    print(adjList)
}

