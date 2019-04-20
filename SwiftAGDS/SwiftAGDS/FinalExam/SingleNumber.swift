//
//  SingleNumber.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-04-11.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func singleNumber(_ nums: [Int]) -> Int {
    return 2 * (Set(nums).reduce(0, +)) - nums.reduce(0, +)
}
