//
//  RepeatingSequence.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-03-20.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation
func repeatingSequenceHelper(_ base: Int,_ exponent: Int) -> Int{
    var sum = 0;
    var base = base
    while base > 0 {
        sum += Int(truncating: NSDecimalNumber(decimal: pow(Decimal(base % 10), exponent)))
        base /= 10
    }
    return sum
}

func repeatingSequence(){
    var input = readLine()!.split(separator: " ").map{Int($0)}
    var initialNumber = input[0]!
    let exponent = input[1]!
    var array: [Int] = []
    array.append(initialNumber)
    initialNumber = repeatingSequenceHelper(initialNumber, exponent)
    array.append(initialNumber)
    while !array[0...array.count - 2].contains(initialNumber) {
        initialNumber = repeatingSequenceHelper(initialNumber, exponent)
        array.append(initialNumber)
    }
    let count = array.firstIndex(of: array.last!)!
    print(count)
}
