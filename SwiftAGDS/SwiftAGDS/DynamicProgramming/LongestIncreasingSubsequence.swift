//
//  LongestIncreasingSubsequence.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-04-10.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func lengthOfLIS(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    var d = [Int](repeating: 1, count: nums.count)
    for i in 0..<nums.count {
        for j in 0..<i {
            if nums[j] < nums[i] && d[i] < d[j] + 1 {
                d[i] = d[j] + 1
            }
        }
    }
    return d.max()!
}
