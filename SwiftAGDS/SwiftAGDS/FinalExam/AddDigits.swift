//
//  AddDigits.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-04-12.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func addDigits(_ num: Int) -> Int {
    var digitsArray = String(num).map{Int(String($0))!}
    if digitsArray.count == 1 {
        return digitsArray[0]
    } else {
        let sum = digitsArray.reduce(0, +)
        return addDigits(sum)
    }
}
