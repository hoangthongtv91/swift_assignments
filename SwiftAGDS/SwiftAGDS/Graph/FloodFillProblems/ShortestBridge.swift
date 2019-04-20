//
//  ShortestBridge.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-03-24.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func generateCountryMap(_ countryMap: inout [[Int]],_ i: Int,_ j: Int,_ count: inout Int) {
    countryMap[i][j] = count
    if i < countryMap.count - 1 && countryMap[i + 1][j] == 1 {
        generateCountryMap(&countryMap, i + 1, j, &count)
    }
    if i > 0 && countryMap[i - 1][j] == 1 {
        generateCountryMap(&countryMap, i - 1, j, &count)
    }
    if j < countryMap.count - 1 && countryMap[i][j + 1] == 1 {
        generateCountryMap(&countryMap, i, j + 1, &count)
    }
    if j > 0 && countryMap[i][j - 1] == 1 {
        generateCountryMap(&countryMap, i, j - 1, &count)
    }
}

func checkTheShortestPath(_ countryMap: inout [[Int]],_ i: Int,_ j: Int,_ currentAnswer: inout Int,_ soFar: Int,_ x: Int,_ countryArray: [Int]) {
    let a = countryMap[i][j]
    var soFar = soFar
    soFar += 1
    if countryArray.contains(countryMap[i][j]) {
        if soFar < currentAnswer {
            currentAnswer = soFar
        }
    } else {
        countryMap[i][j] = -1
        if i < countryMap.count - 1 && countryMap[i + 1][j] != -1 {
            checkTheShortestPath(&countryMap, i + 1, j, &currentAnswer, soFar, x, countryArray)
        }
        if i > 0 && countryMap[i - 1][j] != -1{
            checkTheShortestPath(&countryMap, i - 1, j, &currentAnswer, soFar, x, countryArray)
        }
        if j < countryMap.count - 1 && countryMap[i][j + 1] != -1{
            checkTheShortestPath(&countryMap, i, j + 1, &currentAnswer, soFar, x, countryArray)
        }
        if j > 0 && countryMap[i][j - 1] != -1{
            checkTheShortestPath(&countryMap, i, j - 1, &currentAnswer, soFar, x, countryArray)
        }
    }
    countryMap[i][j] = a
}

func shortestBridge() {
    let N = Int(readLine()!)!
    var countryMap: [[Int]] = []
    for _ in 0..<N {
        countryMap.append(readLine()!.split(separator: " ").map{Int($0)!})
    }
    var countryArray: [Int] = []
    var count = 2
    for i in 0..<N {
        for j in 0..<N{
            if countryMap[i][j] == 1 {
                countryArray.append(count)
                generateCountryMap(&countryMap, i, j, &count)
                count += 1
            }
        }
    }
    var currentAnswer = N * N
    while !countryArray.isEmpty {
        let x = countryArray.removeFirst()
        for i in 0..<N {
            for j in 0..<N {
                if countryMap[i][j] == x {
                    countryMap[i][j] = -1
                    if i < N - 1 && countryMap[i + 1][j] == 0 {
                        checkTheShortestPath(&countryMap, i + 1, j, &currentAnswer, 0, x, countryArray)
                    }
                    if i > 0 && countryMap[i - 1][j] == 0 {
                        checkTheShortestPath(&countryMap, i - 1, j, &currentAnswer, 0, x, countryArray)
                    }
                    if j < N - 1 && countryMap[i][j + 1] == 0 {
                        checkTheShortestPath(&countryMap, i, j + 1, &currentAnswer, 0, x, countryArray)
                    }
                    if j > 0 && countryMap[i][j - 1] == 0 {
                        checkTheShortestPath(&countryMap, i, j - 1, &currentAnswer, 0, x, countryArray)
                    }
                }
            }
        }
    }
    print(currentAnswer - 1)
}
