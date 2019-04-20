//
//  TomatoFarm.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-03-24.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func checkAllDirectionsForFarm(_ farm: inout [[Int]],_ i: Int,_ j: Int,_ height: Int,_ width: Int,_ checkpoint: inout Int,_ isRiped: inout Bool) {
    farm[i][j] = checkpoint + 1
    if i < height - 1 && farm[i + 1][j] == 0 {
        farm[i + 1][j] = checkpoint + 1
        isRiped = false
    }
    if i > 0 && farm[i - 1][j] == 0 {
        farm[i - 1][j] = checkpoint + 1
        isRiped = false
    }
    if j < width - 1 && farm[i][j + 1] == 0 {
        farm[i][j + 1] = checkpoint + 1
        isRiped = false
    }
    if j > 0 && farm[i][j - 1] == 0 {
        farm[i][j - 1] = checkpoint + 1
        isRiped = false
    }
}

func tomatoFarm() {
    let firstLine = readLine()!.split(separator: " ").map{Int($0)!}
    let width = firstLine[0]
    let height = firstLine[1]
    var farm: [[Int]] = []
    for _ in 0..<height {
        farm.append(readLine()!.split(separator: " ").map{Int($0)!})
    }
    var FLAG = true
    for i in farm {
        if i.contains(0) {
            FLAG = false
        }
    }
    var checkpoint = 1
    var numOfDays = 0
    while !FLAG {
        var isRiped = true
        for i in 0..<height {
            for j in 0..<width {
                if farm[i][j] == checkpoint {
                    checkAllDirectionsForFarm(&farm, i, j, height, width, &checkpoint, &isRiped)
                }
            }
        }
        FLAG = isRiped
        if FLAG == false {
            numOfDays += 1
        }
        checkpoint += 1
    }
    for i in farm {
        if i.contains(0) {
            FLAG = false
        }
    }
    if FLAG == true {
        print(numOfDays)
    } else {
        print(-1)
    }
}
