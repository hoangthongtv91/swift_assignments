//
//  FindTheDifference.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-04-12.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

func findTheDifference(_ s: String, _ t: String) -> Character {
    let sArray = Array(s)
    let tArray = Array(t)
    var a = 0, b = 0
    for i in sArray {
        a += i.ascii
    }
    for i in tArray {
        b += i.ascii
    }
    return Character.getCharacter(fromAscii: b - a)
}
