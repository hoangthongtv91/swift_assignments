//
//  ForeGoneSolution.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-04-05.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func foreGoneSolution(){
    let numOfTests = Int(readLine()!)!
    var inputArray: [Int] = []
    for _ in 0..<numOfTests {
        inputArray.append(Int(readLine()!)!)
    }
    for (i,N) in inputArray.enumerated() {
        for j in 1...N/2 {
            var FLAG = true
            let num1 = j
            var tempNum1 = num1
            let num2 = N - j
            var tempNum2 = num2
            while tempNum1 != 0 {
                let x = tempNum1 % 10
                if x == 4 {
                    FLAG = false
                    break
                }
                tempNum1 /= 10
            }
            while tempNum2 != 0 && FLAG == true{
                let x = tempNum2 % 10
                if x == 4 {
                    FLAG = false
                    break
                }
                tempNum2 /= 10
            }
            if FLAG == true {
                print("Case #\(i + 1): \(num1) \(num2)")
                break
            }
        }
    }
}
