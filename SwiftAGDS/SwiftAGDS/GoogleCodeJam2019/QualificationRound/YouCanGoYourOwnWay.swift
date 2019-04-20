//
//  YouCanGoYourOwnWay.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-04-05.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func searchForWay(_ i: Int,_ j: Int,_ N: Int,_ maze: inout [[Character]],_ soFar: String) {
    if i == N - 1 && j == N - 1 {
        print(soFar)
        maze = [[Character]](repeating: [Character](repeating: "A", count: N), count: N)
    } else {
        if i < N - 1 && maze[i][j] == "E" {
            searchForWay(i + 1, j, N, &maze, soFar + "S")
        }
        if j < N - 1 && maze[i][j] == "S" {
            searchForWay(i, j + 1, N, &maze, soFar + "E")
        }
        if maze[i][j] == "O" {
            if j < N - 1 {
                searchForWay(i, j + 1, N, &maze, soFar + "E")
            }
            if i < N - 1 {
                searchForWay(i + 1, j, N, &maze, soFar + "S")
            }
        }
    }
}

func youCanGoYourOwnWay() {
    let firstLine = Int(readLine()!)!
    var numTests = 0
    while numTests < firstLine {
        let N = Int(readLine()!)!
        var maze: [[Character]] = [[Character]](repeating: [Character](repeating: "O", count: N), count: N)
        let P = readLine()!.map{$0}
        var i = 0, j = 0, x = 0
        while x < P.count {
            maze[i][j] = P[x]
            if P[x] == "S" {
                i += 1
            } else {
                j += 1
            }
            x += 1
        }
        print("Case #\(numTests + 1): ", terminator: "")
        searchForWay(0, 0, N, &maze, "")
        numTests += 1
    }
}

