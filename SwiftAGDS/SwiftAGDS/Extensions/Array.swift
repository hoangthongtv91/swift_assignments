//
//  Array.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-04-06.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

extension Array where Element: Equatable {
    mutating func removeDuplicates() {
        var result = [Element]()
        for value in self {
            if !result.contains(value) {
                result.append(value)
            }
        }
        self = result
    }
}
