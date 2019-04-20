//
//  Character+CharacterTool.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-03-25.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

extension Character {
    var ascii: Int {
        return Int(self.unicodeScalars.first!.value)
    }
    static func getCharacter(fromAscii: Int) -> Character {
        return Character(UnicodeScalar(fromAscii)!)
    }
}
