//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/minimum-operations-to-exceed-threshold-value-ii/solutions/6419611/swift-solution-min-heap-by-nihad_s-avw5

    The given Swift solution uses a **min-heap** to efficiently find and process the two smallest elements in `nums` 
    iteratively until all elements are at least `k`. The `Heap` data structure is assumed to support efficient extraction `popMin()`
    and insertion `insert(_)` of elements in $$\log n$$. The algorithm works as follows: 
    (1) It initializes a min-heap with the elements of `nums`. 
    (2) While there are at least two elements in the heap and the smallest element is less than `k`, 
        it removes the two smallest values `x` and `y`, computes the new value `(min(x, y) * 2 + max(x, y))`, 
        and inserts it back into the heap. 
    (3) The process repeats until all elements in the heap are at least `k`. 
        The result is calculated as the difference between the original array size and the remaining heap size, 
        representing the number of operations performed.
*/

class Solution {
    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        var minHeap = Heap(nums)

        while minHeap.count > 1, minHeap.min! < k {
            let (x, y) = (minHeap.popMin()!, minHeap.popMin()!)
            minHeap.insert(min(x, y) * 2 + max(x, y))
        }

        return nums.count - minHeap.count
    }
}
