//
//  SumOfSquareNumber.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-04-10.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func sumofSquareNumber(_ n: Int) -> Bool {
    if n == 0 {
        return true
    } else {
        var FLAG = false
        let x = sqrt(Double(n))
        for i in 1...Int(x.rounded()) {
            let target = n - (i * i)
            if sqrt(Double(target)) == sqrt(Double(target)).rounded() {
                FLAG = true
                break
            }
        }
        return FLAG
    }
}
