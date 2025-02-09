//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/design-a-number-container-system/solutions/6398390/swift-solution-heap-by-nihad_s-85pf/

    The `change` method updates the `indexToNumber` dictionary to store a given number at a specific index and adds that index
    to a heap in the `numberToIndices` dictionary, which maps each number to a collection of indices where it appears. 
    The heap ensures efficient retrieval of the smallest index for each number. The `find` method searches for the smallest 
    index where a given number is stored by checking the heap. If the smallest index holds the correct number, 
    it returns that index; otherwise, it pops the index from the heap and recursively checks the next smallest index,
    returning `-1` if no valid index is found.
*/

class NumberContainers {
    private var indexToNumber = [Int: Int]()
    private var numberToIndices = [Int: Heap<Int>]()

    func change(_ index: Int, _ number: Int) {
        indexToNumber[index] = number
        numberToIndices[number, default: Heap<Int>()].insert(index)
    }
    
    func find(_ number: Int) -> Int {
        if let index = numberToIndices[number]?.min {
            if indexToNumber[index] == number {
                return index
            }
            numberToIndices[number]?.popMin()
            return find(number)
        }
        return -1
    }
}
