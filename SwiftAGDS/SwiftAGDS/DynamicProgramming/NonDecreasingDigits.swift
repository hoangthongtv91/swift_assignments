//
//  NonDecreasingDigits.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-04-10.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func nonDecreasingDigits(_ n: Int) -> Int {
    if n == 1 {
        return 10
    } else {
        var d: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 1000)
        for i in 0...9 {
            d[1][i] = 1
        }
        for x in 2...n {
            for i in 0...9 {
                for j in 0...i {
                    d[x][i] += d[x - 1][j]
                }
            }
        }
        var ans = 0
        for i in 0...9 {
            ans += d[n][i]
        }
        return ans
    }
}
