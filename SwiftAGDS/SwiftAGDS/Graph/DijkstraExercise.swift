//
//  DijkstraExercise.swift
//  SwiftAGDS
//
//  Created by Thong Hoang Nguyen on 2019-03-28.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import Foundation

struct Node: Comparable {
    let node: Int
    let dist: Int // cost: shortest distances
    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.dist < rhs.dist
    }
}

func Dijkstras() {
    // # of vertices: 1, 2, 3, ..., n
    // start with 1
    let n = Int(readLine()!)!
    var adjList = [[(Int, Int)]](repeating: [], count: n + 1)
    var dist = [Int](repeating: Int.max, count: n + 1)
    var pq = PriorityQueue<Node>()
    pq.enqueue(Node(node: 1, dist: 0))
    dist[1] = 0
    // # of edges
    // adj = [], [(2, w1), (3, w2)], [(1, w3), (4, w4)], ...
    //                   1                    2
    let m = Int(readLine()!)!
    for _ in 0..<m {
        // u, v, w
        let edge = readLine()!.split(separator: " ").map { Int($0)! }
        let u = edge[0]
        adjList[u].append((edge[1], edge[2]))
    }
    // Dijkstra's Algorithm PQ: O(VlogV + ElogV)
    while !pq.isEmpty {
        let u:Node = pq.dequeue()! // min distance node
        for (v, w) in adjList[u.node] { // check all neighbors
            if dist[v] > u.dist + w {  // "relax"
                dist[v] = u.dist + w     //  update the dist table
                pq.enqueue(Node(node: v, dist: u.dist + w))
            }
        }
    }
    print(dist) // [max, 0, 10, ... ]
}
