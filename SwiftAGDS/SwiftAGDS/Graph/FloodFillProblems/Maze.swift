//
//  Maze.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-03-22.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func pathRecursion(_ maze: inout [[Int]],_ i: Int,_ j: Int,_ width: Int,_ height:Int,_ currentAnswer: inout Int,_ soFar: Int) {
    maze[i][j] = 2
    var soFar = soFar
    soFar += 1
    if i == height - 1 && j == width - 1 {
        if soFar < currentAnswer {
            currentAnswer = soFar
        }
    } else {
        if i < height - 1 && maze[i + 1][j] == 1 {
            pathRecursion(&maze, i + 1, j, width, height, &currentAnswer, soFar)
        }
        if i > 0 && maze[i - 1][j] == 1 {
            pathRecursion(&maze, i - 1, j, width, height, &currentAnswer, soFar)
        }
        if j < width - 1 && maze[i][j + 1] == 1 {
            pathRecursion(&maze, i, j + 1, width, height, &currentAnswer, soFar)
        }
        if j > 0 && maze[i][j - 1] == 1 {
            pathRecursion(&maze, i, j - 1, width, height, &currentAnswer, soFar)
        }
    }
    maze[i][j] = 1
}
func printTheShortestWay() {
    let firstLine = readLine()!.split(separator: " ").map{Int($0)!}
    let width = firstLine[1]
    let height = firstLine[0]
    var maze: [[Int]] = []
    for _ in 0..<height {
        maze.append(readLine()!.map{Int(String($0))!})
    }
    var currentAnswer = width * height
    pathRecursion(&maze, 0, 0, width, height, &currentAnswer, 0)
    print(currentAnswer)
}
