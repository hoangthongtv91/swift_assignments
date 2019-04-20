//
//  FindAllNumbersDisappeared.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-04-12.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    var result: [Int] = [Int](repeating: 0, count: nums.count + 1)
    for i in nums {
        result[i] += 1
    }
    var count = 0
    for i in 1..<result.count {
        if result[i] == 0 {
            result[count] = i
            count += 1
        }
    }
    result.removeSubrange(count..<result.count)
    return result
}




