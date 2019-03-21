//
//  GermanLotto.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-03-17.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation
func GermanLottoHelper(_ number: Int,_ lottoArray: [Int],_ prefix: String = ""){
    if number == 0{
        print(prefix)
    }else{
        for (index, elem) in lottoArray.enumerated(){
            var tempArray = lottoArray
            tempArray.removeFirst(index + 1)
            GermanLottoHelper(number - 1, tempArray, prefix + " \(elem)")
        }
    }
}

func printGermanLotto(){
    print("input 6 < k < 13 and set S in ascending orfer (1...49) line by line, \"0\" to stop: ")
    var array: [String] = []
    repeat{
        array.append(readLine()!)
    }while array.last! != "0"
    array.removeLast()
    for i in array{
        var lottoArrayOptional = i.split(separator: " ").map{Int($0)}
        lottoArrayOptional.removeFirst()
        var lottoArrayUnwrapped: [Int] = []
        for j in lottoArrayOptional{
            lottoArrayUnwrapped.append(j!)
        }
        GermanLottoHelper(6, lottoArrayUnwrapped)
        print()
    }
}
