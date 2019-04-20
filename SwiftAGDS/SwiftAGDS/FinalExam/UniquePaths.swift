//
//  UniquePaths.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-04-12.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func uniquePathsHelper(_ i: Int,_ j: Int,_ grid: inout [[Int]],_ count: inout Int) {
    grid[i][j] = 1
    if i == grid.count - 1 && j == grid[0].count - 1 {
        count += 1
    } else {
        if i < grid.count - 1 && grid[i + 1][j] == 0 {
            uniquePathsHelper(i + 1, j, &grid, &count)
        }
        if j < grid[0].count - 1 && grid[i][j + 1] == 0{
            uniquePathsHelper(i, j + 1, &grid, &count)
        }
    }
    grid[i][j] = 0
}
func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var grid: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    var count = 0
    uniquePathsHelper(0, 0, &grid, &count)
    return count
}
