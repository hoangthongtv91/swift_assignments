//
//  Cryptopangrams.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-04-06.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func cryptopangrams() {
    let firstLine = Int(readLine()!)!
    var numTests = 0
    while numTests < firstLine {
        let firstInput = readLine()!.split(separator: " ").map{Int($0)!}
        let N = firstInput[0]
        let L = firstInput[1]
        var inputArray = readLine()!.split(separator: " ").map{Int($0)!}
        var primeArray: [Int] = []
        var number = 3
        while number <= N {
            var count = 1
            for i in 1...(number/2) {
                if number % i == 0 {
                    count += 1
                }
            }
            if count == 2 {
                primeArray.append(number)
            }
            number += 2
        }
        var resultArray: [Int] = []
        var x = 0
        while x < L - 1 {
            for prime in primeArray {
                if inputArray[x] % prime == 0 {
                    if inputArray[x + 1] % prime == 0 {
                        resultArray.append(inputArray[x] / prime)
                        if x == L - 2 {
                            resultArray.append(prime)
                        }
                        break
                    } else {
                        resultArray.append(prime)
                        if x == L - 2 {
                            resultArray.append(inputArray[x] / prime)
                        }
                        break
                    }
                }
            }
            x += 1
        }
        resultArray.append(inputArray[L - 1] / resultArray.last!)
        var tempArray: [Int] = []
        for value in resultArray {
            if !tempArray.contains(value) {
                tempArray.append(value)
            }
        }
        quickSort(&tempArray, 0, tempArray.count - 1)
        var alphabetDictionary: [Int : String] = [:]
        var alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        var y = 0
        for i in tempArray {
            alphabetDictionary[i] = alphabet[y]
            y += 1
        }
        print("Case #\(numTests + 1): ", terminator :"")
        for i in resultArray {
            print(alphabetDictionary[i]!, terminator: "")
        }
        print()
        numTests += 1
    }
}
