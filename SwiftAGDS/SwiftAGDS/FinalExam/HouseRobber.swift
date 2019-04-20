//
//  HouseRobber.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-04-12.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func rob(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    if nums.count == 1 {
        return nums[0]
    } else if nums.count == 2 {
        return nums[0] > nums[1] ? nums[0] : nums[1]
    } else {
        var d: [Int] = [Int](repeating: 0, count: nums.count)
        d[0] = nums[0]
        d[1] = nums[0] > nums[1] ? nums[0] : nums[1]
        for i in 2..<nums.count {
            d[i] = d[i - 2] + nums[i]
            var x = d[0...(i - 1)].max()!
            if d[i] < x {
                d[i] = x
            }
        }
        return d[nums.count - 1]
    }
}
