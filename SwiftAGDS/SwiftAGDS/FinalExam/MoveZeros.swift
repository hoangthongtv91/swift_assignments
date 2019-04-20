//
//  MoveZeros.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-04-11.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func moveZeros(_ nums: inout [Int]) {
    if nums.contains(0){
        var i = 0
        while nums[i] != 0 {
            i += 1
        }
        var j = i + 1
        while j < nums.count {
            if nums[i] == 0 && nums[j] != 0 {
                nums.swapAt(i, j)
                i += 1
            }
            j += 1
        }
    }
    
}
