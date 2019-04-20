//
//  PriorityQueue.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-03-25.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

struct PriorityQueue<E> where E: Comparable {
    private var elements: Heap<E>
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    init() {
        elements = Heap<E>()
    }
    
    func peek() -> E? {
        return elements.max()
    }
    
    mutating func enqueue(_ elem: E) {
        elements.insert(elem)
    }
    
    mutating func dequeue() -> E? {
        return elements.extractMax()
    }
    
    mutating func increaseKey(at index: Int, with value: E) {
        elements.replace(at: index, with: value)
    }
}
