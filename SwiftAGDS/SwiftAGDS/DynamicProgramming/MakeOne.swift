//
//  MakeOne.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-04-08.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func makeOne(_ n: Int) -> Int {
    if n == 1 {
        return 0
    } else if n == 2 {
        return 1
    } else {
        var d: [Int] = [Int](repeating: 0, count: 100)
        d[1] = 0
        d[2] = 1
        for i in 3...n {
            d[i] = d[i - 1] + 1
            if i % 3 == 0 && d[i] > d[i / 3] {
                d[i] = d[i / 3] + 1
            }
            if i % 2 == 0 && d[i] > d[i / 2] {
                d[i] = d[i / 2] + 1
            }
        }
        return d[n]
    }
    
}
