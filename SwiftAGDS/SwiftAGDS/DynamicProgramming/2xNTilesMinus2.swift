//
//  2xNTilesMinus2.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-04-09.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func numberOfWaysToFillUp2xNTilesMinus2(_ N: Int) -> Int {
    if N == 1 {
        return 1
    } else if N == 2 {
        return 3
    } else if N == 3 {
        return 5
    } else {
        var d: [Int] = [Int](repeating: 0, count: 100)
        d[1] = 1
        d[2] = 3
        d[3] = 5
        for i in 3...N {
            d[i] = d[i - 1] + (d[i - 2] * 2)
        }
        return d[N]
    }
    
}
