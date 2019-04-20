//
//  PrettyNumber.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-04-08.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func numOfPrettyNumber(_ n: Int) -> Int {
    var d: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 100)
    d[1][0] = 0
    for i in 1...9 {
        d[1][i] = 1
    }
    for x in 2...n {
        for i in 0...9 {
            if i > 0 {
                d[x][i] += d[x - 1][i - 1]
            }
            if i < 9 {
                d[x][i] += d[x - 1][i + 1]
            }
        }
    }
    var ans = 0
    for i in 0...9 {
        ans += d[n][i]
    }
    return ans
}
