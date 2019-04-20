//
//  GroupOfTownProblem.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-03-20.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func checkAllDirections(_ table: inout [[Int]],_ i: Int,_ j: Int,_ count: inout Int,_ result: inout [Int] ){
    table[i][j] = count
    if i < table.count - 1 && table[i + 1][j] == 1 {
        result.append(count)
        checkAllDirections(&table, i + 1, j, &count, &result)
    }
    if i > 0 && table[i - 1][j] == 1 {
        result.append(count)
        checkAllDirections(&table, i - 1, j, &count, &result)
    }
    if j < table.count - 1 && table[i][j + 1] == 1 {
        result.append(count)
        checkAllDirections(&table, i, j + 1, &count, &result)
    }
    if j > 0 && table[i][j - 1] == 1 {
        result.append(count)
        checkAllDirections(&table, i, j - 1, &count, &result)
    }
}

func townProblemOutput(){
    let size = Int(readLine()!)!
    var table = Array<Array<Int>>(repeating: [], count: size)
    for i in 0..<table.count {
        var arr = readLine()!.map{Int(String($0))!}
        for j in 0..<arr.count {
            table[i].append(arr[j])
        }
    }
    var result: [Int] = []
    var count = 2
    for i in 0..<table.count {
        for j in 0..<table.count{
            if table[i][j] == 1 {
                result.append(count)
                checkAllDirections(&table, i, j, &count, &result)
                count += 1
            }
        }
    }
    print(count - 2)
    count -= 1
    var numHousesArray: [Int] = []
    var count2 = 0
    while count > 1 {
        for i in result {
            if i == count {
                count2 += 1
            }
        }
        numHousesArray.append(count2)
        count2 = 0
        count -= 1
    }
    quickSort(&numHousesArray, 0, numHousesArray.count - 1)
    for i in numHousesArray {
        print(i)
    }
}
