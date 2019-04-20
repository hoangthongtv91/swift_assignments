//
//  OneTwoThree.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-04-10.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func oneTwoThreeHelper(_ n: Int) -> Int {
    if n == 1 {
        return 1
    } else if n == 2 {
        return 2
    } else if n == 3 {
        return 4
    } else {
        var d: [Int] = [Int](repeating: 0, count: 100)
        d[1] = 1
        d[2] = 2
        d[3] = 4
        for i in 4...n {
            d[i] = d[i - 1] + d[i - 2] + d[i - 3]
        }
        return d[n]
    }
}
func oneTwoThree() {
    let firstLine = Int(readLine()!)!
    for _ in 0..<firstLine {
        let input = Int(readLine()!)!
        print(oneTwoThreeHelper(input))
    }
}
