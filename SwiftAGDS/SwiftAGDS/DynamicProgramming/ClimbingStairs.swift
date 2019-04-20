//
//  ClimbingStairs.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-04-09.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func climbingStairs(_ n : Int) -> Int {
    if n == 1 {
        return 1
    } else if n == 2 {
        return 2
    } else {
        var d: [Int] = [Int](repeating: 0, count: 100)
        d[1] = 1
        d[2] = 2
        for i in 3...n {
            d[i] = d[i - 1] + d[i - 2]
        }
        return d[n]
    }
}
