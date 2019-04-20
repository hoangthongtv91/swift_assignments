//
//  Sorting.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-03-12.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

//1. Bubble Sort O(n^2)
// - too many swaps
// - bubble up the largest one to the right
func bubbleSort(_ arr:[Int]) -> [Int]{
    var arr = arr
    for i in 0..<arr.count - 1{
        var swap = 0;
        for j in (i+1)..<arr.count{
            if arr[i] > arr[j]{
                arr.swapAt(i, j)
                swap += 1
            }
        }
        if swap == 0 {break}
    }
    return arr
}

//2. Selection sort O(n^2)
// - each scan select min and put it the left
// - swap
func selectionSort(_ arr:[Int]) -> [Int]{
    var arr = arr
    for i in 0..<arr.count - 1{
        var min = i
        for j in (i+1)..<arr.count{
            if arr[j] < arr[min]{
                min = j
            }
        }
        arr.swapAt(i, min)
    }
    return arr
}

//3. InserttionSort O(n^2)
// - sorted | unsorted
// - inserting elem from unsorted portion into sort portion
// - shift
func insertionSort(_ arr:[Int]) -> [Int]{
    var arr = arr
    for i in 1..<arr.count {
        let toInsert = arr[i]
        var j = i - 1
        while j >= 0 {
            if toInsert < arr[j]{
                arr[j+1] = arr[j]
            }else{
                break
            }
            j -= 1
        }
        arr[j+1] = toInsert
    }
    return arr
}


//Divide-Conquer

//4. MergeSort O(n log n)
// Space-Complexity O(n)
func mergeSort(_ arr:[Int]) -> [Int] {
    if arr.count <= 1 {
        return arr
    }
    let mid = arr.count / 2
    let left = mergeSort(Array(arr[..<mid]))
    let right = mergeSort(Array(arr[mid...]))
    
    return merge(left, right)
}
func merge(_ left:[Int], _ right:[Int]) -> [Int] {
    var i = 0, j = 0
    var merged:[Int] = []
    while i < left.count && j < right.count {
        if left[i] < right[j] {
            merged.append(left[i])
            i += 1
        } else {
            merged.append(right[j])
            j += 1
        }
    }
    if i == (left.count - 1) { // leftover from right
        merged += right[j...]
    } else { // leftover from left
        merged += left[i...]
    }
    return merged
}

// quickSort()
// partition() -> Int
// - picks the last elem as pivot
// - move around
// - return index of pivot
func quickSort(_ arr: inout [Int],_ start:Int,_ end:Int) {
    if start < end {
        let pivot_i = partition(&arr, start, end)
        quickSort(&arr, start, (pivot_i - 1))
        quickSort(&arr, (pivot_i + 1), end)
    }
}
func partition(_ arr: inout [Int],_ start:Int,_ end:Int) -> Int{
    var pivot_i = start
    var i = start
    while i < end{
        if arr[i] < arr[end]{
            arr.swapAt(pivot_i, i)
            pivot_i += 1
        }
        i += 1
    }
    arr.swapAt(end, pivot_i)
    return pivot_i
}

func topologicalSort(_ adjList: [[Int]],_ indegrees: inout [Int]) {
    var queue = Queue<Int>()
    for i in 1...indegrees.count - 1 {
        if indegrees[i] == 0 {
            queue.enqueue(i)
        }
    }

    for _ in 1...adjList.count - 1 {
        let x = queue.dequeue()!
        print(x)
        for i in adjList[x] {
            indegrees[i] -= 1
            if indegrees[i] == 0 {
                queue.enqueue(i)
            }
        }
    }
}
