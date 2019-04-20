//
//  ReverseInteger.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-04-11.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func reverse(_ x: Int) -> Int {
    var x = x
    if x < 0 {
        return -reverse(-x)
    }
    var rev = 0
    while (x != 0) {
        let pop = x % 10
        x /= 10
        if (rev > Int.max / 10 || (rev == Int.max / 10 && pop > 7)) { return 0 }
        if (rev < Int.min / 10 || (rev == Int.min / 10 && pop < -8)) { return 0 }
        rev = rev * 10 + pop
    }
    return rev
}
