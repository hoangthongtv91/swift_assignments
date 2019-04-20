//
//  FizzBuzz.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-04-11.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func fizzBuzz(_ n : Int) -> [String] {
    var result: [String] = []
    for i in 1...n {
        if i % 3 == 0 && i % 5 != 0 {
            result.append("Fizz")
        } else if i % 5 == 0 && i % 3 != 0 {
            result.append("Buzz")
        } else if i % 3 == 0 && i % 5 == 0 {
            result.append("FizzBuzz")
        } else {
            result.append("\(i)")
        }
    }
    return result
}
