//
//  main.swift
//  LeetCode
//
//  Created by Nihad on 11/17/21.
//

import Foundation

let cache = LRUCache(5)
cache.put(10, 111_10)
cache.put(5, 111_5)
cache.put(2, 111_2)
print(cache.elements)
print()
