//
//  HowManyIslands.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-03-22.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func checkAllDirections2(_ table: inout [[Int]],_ i: Int,_ j: Int,_ count: inout Int,_ height: Int,_ width: Int) {
    table[i][j] = count
    if i < height - 1 && table[i + 1][j] == 1 {
        checkAllDirections2(&table, i + 1, j, &count, height, width)
    }
    if i > 0 && table[i - 1][j] == 1 {
        checkAllDirections2(&table, i - 1, j, &count, height, width)
    }
    if j < width - 1 && table[i][j + 1] == 1 {
        checkAllDirections2(&table, i, j + 1, &count, height, width)
    }
    if j > 0 && table[i][j - 1] == 1 {
        checkAllDirections2(&table, i, j - 1, &count, height, width)
    }
    if i > 0 && j > 0 && table[i - 1][j - 1] == 1 {
        checkAllDirections2(&table, i - 1, j - 1, &count, height, width)
    }
    if i > 0 && j < width - 1 && table[i - 1][j + 1] == 1 {
        checkAllDirections2(&table, i - 1, j + 1, &count, height, width)
    }
    if i < height - 1 && j > 0 && table[i + 1][j - 1] == 1 {
        checkAllDirections2(&table, i + 1, j - 1, &count, height, width)
    }
    if i < height - 1 && j < width - 1 && table[i + 1][j + 1] == 1 {
        checkAllDirections2(&table, i + 1, j + 1, &count, height, width)
    }
}

func printNumberOfIsland() {
    var firstLine = readLine()!
    while firstLine != "0 0" {
        var lines = firstLine.split(separator: " ").map{Int(String($0))!}
        var table: [[Int]] = []
        for _ in 0..<lines[1] {
            table.append(readLine()!.split(separator: " ").map{Int($0)!})
        }
        var count = 2
        for i in 0..<lines[1] {
            for j in 0..<lines[0]{
                if table[i][j] == 1 {

                    checkAllDirections2(&table, i, j, &count, lines[1], lines[0])
                    count += 1
                }
            }
        }
        print(count - 2)
        firstLine = readLine()!
    }
}
