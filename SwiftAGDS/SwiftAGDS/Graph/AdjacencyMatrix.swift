//
//  AdjacencyMatrix.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-03-18.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation
func AdjacencyMatrix(){
    let firstLine = readLine()!.split(separator: " ")
    let n = Int(firstLine[0])!
    let m = Int(firstLine[1])!
    var matrix: [[Int]] = []
    for _ in 0..<n{
        matrix.append(Array<Int>(repeating: 0, count: n))
    }
    for _ in 0..<m{
        let edges = readLine()!.split(separator: " ")
        let u = Int(edges[0])! - 1
        let v = Int(edges[1])! - 1
        matrix[u][v] = 1
        matrix[v][u] = 1
    }
    for row in matrix{
        print(row)
    }
}
