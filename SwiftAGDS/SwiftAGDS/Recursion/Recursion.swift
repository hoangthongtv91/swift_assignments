//
//  Recursion.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-03-08.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func power(_ base:Int, _ exponent: Int) -> Int{
    if exponent == 1 {
        return base
    }else{
        return power(base, exponent - 1) * base
    }
}

func factorial(_ n: Int) -> Int{
    if n == 1{
        return 1
    }
    return n * factorial(n - 1)
}

func isPalindrome(_ word: String) -> Bool{
    if word.count <= 1 {
        return true
    }else if word[word.startIndex] == word[word.index(before: word.endIndex)] {
        return isPalindrome(String(word[word.index(after: word.startIndex)..<word.index(before: word.endIndex)]) )
    }
    return false
}


func printBinary(_ num: Int){
    if num < 0 {
        print("-", terminator: "")
        printBinary(-num)
    }
    if num > 0{
        printBinary(num/2)
        print(num % 2, terminator:"")
    }
}

func reverseLines(_ position: Int){
    let contents = try! String(contentsOfFile: "/Users/thongnguyen/XCodeProjects/SwiftProject/SwiftAGDS/SwiftAGDS/file.text", encoding: .utf8)
    let lines = contents.split(separator: "\n")
    if position < lines.count{
        reverseLines(position + 1)
        print(lines[position])
    }
}

func printBinary2(_ num: Int,_ prefix: String = ""){
    if num == 0{
        print(prefix)
    }else{
        printBinary2(num - 1, prefix + "0")
        printBinary2(num - 1, prefix + "1")
    }
}

func printDecimal(_ num:Int,_ prefix: String = ""){
    if num == 0{
        print(prefix)
    }else{
        for i in 0...9{
            printDecimal(num - 1, prefix + "\(i)")
        }
    }
}

func printPermutationHelper(_ array: inout [String],_ prefix: String = ""){
    if array.count == 0{
        print(prefix)
    }else{
        for i in array{
            array.removeFirst()
            printPermutationHelper(&array, prefix + i)
            array.append(i)
        }
    }
}

func printPermutation(_ str: String){
    var array = str.map{String($0)}
    printPermutationHelper(&array)
}

func printCombinationsWithoutRepetitionFrom<T>(_ array: [T],_ taking: Int,_ prefix: String = ""){
    if taking == 0 {
        print(prefix)
    }
    for (index, element) in array.enumerated() {
        var tempArray = array
        tempArray.removeFirst(index + 1)
        printCombinationsWithoutRepetitionFrom(tempArray, taking - 1, prefix + " \(element)")
    }
}

func rollDiceHelper(_ numberOfDices:Int,_ array: inout [Int],_ sum: Int){
    if numberOfDices == 0{
        if sum == 0{
            print(array)
        }
    }else{
        var sum = sum
        for i in 1...6{
            array.append(i)
            sum -= i
            if sum >= 0{
                rollDiceHelper(numberOfDices - 1, &array, sum)
            }
            array.removeLast()
            sum += i
            
        }
    }
}
func rollDice(_ numberOfDices: Int,_ sum: Int){
    var array: [Int] = []
    rollDiceHelper(numberOfDices, &array, sum)
}
