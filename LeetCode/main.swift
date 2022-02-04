//
//  main.swift
//  LeetCode
//
//  Created by Nihad on 11/17/21.
//

import Foundation

class RandomizedSet {

    var set: Set<Int> = []

    init() { }

    func insert(_ val: Int) -> Bool {
        return set.insert(val).0
    }

    func remove(_ val: Int) -> Bool {
        return set.remove(val) != nil
    }

    func getRandom() -> Int {
        return set.randomElement()!
    }
}

// Your RandomizedSet object will be instantiated and called as such:
let obj = RandomizedSet()
let ret_1: Bool = obj.insert(2)
let ret_2: Bool = obj.remove(2)
let ret_3: Int = obj.getRandom()

