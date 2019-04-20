//
//  DecodeWays.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-04-10.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func decodeWays(_ n: String) -> Int {
    var digitsArray = n.map{String($0)}
    if digitsArray[0] == "0" {
        return 0
    } else {
        var d: [Int] = [Int](repeating: 0, count: digitsArray.count)
        for i in 0..<digitsArray.count {
            if Int(digitsArray[i])! > 0 {
                d[i] += 1
            }
            if i > 0 && Int(digitsArray[i - 1] + digitsArray[i])! <= 26 && Int(digitsArray[i - 1])! > 0 {
                d[i] = d[i - 1] + 1
            }
            if Int(digitsArray[i])! == 0 {
                d[i] -= 1
            }
            if i > 0 && Int(digitsArray[i - 1])! == 0 && Int(digitsArray[i])! == 0 {
                return 0
            }
        }
        return d[n.count - 1]
    }
}
