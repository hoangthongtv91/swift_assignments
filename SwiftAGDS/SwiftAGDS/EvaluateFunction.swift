//
//  EvaluateFunction.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-03-11.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func evaluate(_ str: String) -> Int{
    if str.count == 1 {
        return Int(str)!
    }else{
        var s = 0;
        var result = 0;
        var left = 0
        var right = 0
        var opr = ""
        for index in 0..<str.count{
            if (str[index] == "+" || str[index] == "*") && (str[index + 1] == "(" && str[index - 1] == ")"){
                opr = str[index]
                left = evaluate(str[0, (index)])
                right = evaluate(str[(index + 1), (str.count)])
                s += 1
                break
            }
        }
        if s == 0{
            for index in 0..<str.count{
                if str[index] == "+" || str[index] == "*"{
                    opr = str[index]
                    if str[index + 1] == "(" && str[index - 1].isDigits{
                        left = Int(str[index - 1])!
                        right = evaluate(str[(index + 1), (str.count)])
                        break
                    }else if str[index + 1].isDigits && str[index - 1] == ")"{
                        left = evaluate(str[0, (index)])
                        right = Int(str[index + 1])!
                        break
                    }else{
                        left = Int(str[index - 1])!
                        right = Int(str[index + 1])!
                    }
                }
            }
        }
        if opr == "+" {
            result = left + right
        }
        if opr == "*" {
            result = left * right
        }
        return result
    }
}
