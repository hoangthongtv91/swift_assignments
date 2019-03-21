//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-03-18.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

var countQueens = 0
func solveQueens(_ board: inout Board,_ index: Int = 0,_ FLAG: inout Bool) {
    countQueens += 1
    if index == board.size {
        print(board)
        FLAG = true
    } else {
        for i in 0..<board.size {
            if board.isSafe(row: i, col: index){
                board.place(row: i, col: index)
                solveQueens(&board, index + 1, &FLAG)
            }
            if !FLAG {
                board.remove(row: i, col: index)
            }
        }
    }
}
