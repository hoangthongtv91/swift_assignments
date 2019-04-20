//
//  SelfDividingNumber.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-04-12.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
    var result: [Int] = []
    for i in left...right {
        var FLAG = true
        var j = i
        while j != 0 {
            let digit = j % 10
            if digit == 0 {
                FLAG = false
                break
            }
            if i % digit != 0 {
                FLAG = false
                break
            }
            j /= 10
        }
        if FLAG == true {
            result.append(i)
        }
    }
    return result
}
