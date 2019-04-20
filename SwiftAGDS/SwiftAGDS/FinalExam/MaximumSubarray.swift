//
//  MaximumSubarray.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-04-12.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func maxSubArray(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    } else if nums.count == 1 {
        return nums[0]
    } else {
        var d: [Int] = [Int](repeating: 0, count: nums.count)
        d[0] = nums[0]
        for i in 1..<nums.count {
            d[i] = d[i - 1] + nums[i]
            if d[i] < nums[i] {
                d[i] = nums[i]
            }
        }
        return d[0..<nums.count].max()!
    }
}
