//
//  CyclicPermutation.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-03-20.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation
func dfsCyclicPermutation(start: Int, checked: inout [Bool], adjList: inout [[Int]]){
    checked[start] = true
    for next in adjList[start]{
        if checked[next] == false{
            dfsCyclicPermutation(start: next, checked: &checked, adjList: &adjList)
        }
    }
}

func cyclicPermutation(){
    var numTests = Int(readLine()!)!
    while numTests > 0 {
        var _ = readLine()
        var initialArray = readLine()!.split(separator: " ").map{Int($0)!}
        let sortedArray = insertionSort(initialArray)
        var adjList = [[Int]](repeating: [], count: sortedArray.count + 1)
        for i in 1...sortedArray.count {
            adjList[i].append(initialArray[i - 1])
            adjList[initialArray[i - 1]].append(i)
        }
        var check: [Bool] = Array<Bool>(repeating: false, count: sortedArray.count + 1)
        var count = 0
        for node in 1..<adjList.count {
            if !check[node] {
                dfsCyclicPermutation(start: node, checked: &check, adjList: &adjList)
                count += 1
            }
        }
        print(count)
        numTests -= 1
    }
}
