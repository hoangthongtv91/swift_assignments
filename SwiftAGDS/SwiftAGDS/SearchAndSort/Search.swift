//
//  Search.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-03-07.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

//LinearSearch
//Time complexity O(n)
// - Condition: elements don't need to be sorted
func linearsearch(_ target:Int, from array: [Int]) -> Int{
    for (index, elem) in array.enumerated(){
        if elem == target{
            return index
        }
    }
    return -1
}


//BinarySearch
//Time complexity O(log n)
// - Condition: elements need to be sorted
func binarySearch(_ arr: [Int], _ target: Int) -> Int{
    var lower = 0
    var upper = arr.count - 1
    while (lower < upper){
        let mid = (lower + upper) / 2
        if (arr[mid] == target){
            return mid
        }else if (arr[mid] < target){
            lower = mid + 1
        }else{
            upper = mid - 1
        }
    }
    return -1
}
