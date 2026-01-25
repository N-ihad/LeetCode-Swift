//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    2 solutions:
        – 1st: using simple array and simulation, for small n (n<=50 as per leetcode constraints), that solution is actually fine
        – 2nd (below after 1st solution): using linked list for optimizing merge time
*/

/*
    https://leetcode.com/problems/minimum-pair-removal-to-sort-array-i/solutions/7521320/swift-solution-using-array-with-explanat-ovlb

    # Intuition
    ![Screenshot 2026-01-24 at 9.29.43 PM.png](https://assets.leetcode.com/users/images/074dfacf-1b09-4796-a62b-b13611359371_1769279388.4691293.png)

    # Approach
    We repeatedly simulate the operation described in the problem until the array becomes non-decreasing. 
    In each step, we scan all adjacent pairs to find the one with the minimum sum (choosing the leftmost in case of ties), 
    replace that pair with their sum, and count the operation. Since the array size is small, a direct simulation is sufficient.

    ## Main Key Ideas
    - Keep applying operations until the array becomes non-decreasing.
    - In each iteration:
      - Scan all adjacent pairs to find the minimum sum.
      - If multiple pairs have the same minimum sum, choose the leftmost one.
      - Replace the chosen pair with their sum, reducing the array size by one.
    - Increment the operation counter after each replacement.
    - Use a helper function to check whether the array is already non-decreasing.
    - Stop as soon as the array becomes non-decreasing.

    # Complexity
    - Time complexity: $O(n^3)$ in the worst case, because each operation ($O(n)$) involves scanning adjacent pairs ($O(n)$) and checking if the array is sorted ($O(n)$), and there can be up to $O(n)$ operations.
    - Space complexity: $O(n)$, since we maintain a mutable copy of the array.
*/

class Solution {
    func minimumPairRemoval(_ nums: [Int]) -> Int {
        var arr = nums
        var count = 0

        while !isSorted(arr) {
            var minSum = Int.max
            var best = -1

            for i in 0..<arr.count - 1 {
                let s = arr[i] + arr[i + 1]
                if s < minSum {
                    minSum = s
                    best = i
                }
            }

            if best < 0 {
                break
            }

            let sum = arr[best] + arr[best + 1]
            arr.remove(at: best + 1)
            arr[best] = sum
            count += 1
        }
        return count
    }

    private func isSorted(_ a: [Int]) -> Bool {
        for i in 1..<a.count {
            if a[i] < a[i - 1] {
                return false 
            }
        }
        return true
    }
}

/*
    2nd solution using linked list for optimizing merge time

    https://leetcode.com/problems/minimum-pair-removal-to-sort-array-i/solutions/7521295/swift-solution-using-linked-list-with-ex-lc2z

    # Intuition
    ![Screenshot 2026-01-24 at 9.20.11 PM.png](https://assets.leetcode.com/users/images/0cc9e6b7-193e-49c0-b121-1e28c5926fb1_1769278816.5569036.png)

    # Approach
    We simulate the process exactly as described by repeatedly removing the adjacent pair with the minimum sum until the array becomes non-decreasing. 
    To efficiently remove and merge adjacent elements, we represent the array as a doubly linked list. In each operation, we scan the list to find the 
    leftmost adjacent pair with the smallest sum, merge them into a single node, and update the links. We repeat this process until the list is sorted.

    ## Main Key Ideas
    - Convert the array into a **doubly linked list** to allow easy removal and merging of adjacent elements.
    - Repeatedly check if the current list is non-decreasing.
    - In each step:
      - Traverse the list to find the **adjacent pair with the minimum sum** (choosing the leftmost in case of ties).
      - Replace the pair by updating the first node’s value to their sum.
      - Remove the second node by fixing `prev` and `next` pointers.
    - Count how many such merge operations are performed until the list becomes sorted.
    - Return the total number of operations.

    # Complexity
    - Time complexity: $O(n^2)$, since in the worst case we may perform up to $n$ merge operations, and each operation scans the list in $O(n)$ time.
    - Space complexity: $O(n)$, due to the linked list nodes created to represent the array.

    class Node {
        var val: Int
        var prev: Node?
        var next: Node?

        init(_ val: Int, prev: Node? = nil, next: Node? = nil) {
            self.val = val
            self.prev = prev
            self.next = next
        }
    }

    class Solution {
        func minimumPairRemoval(_ nums: [Int]) -> Int {
            var dummy = Node(0)
            var result = 0
            var prev = dummy
            for i in 0..<nums.count {
                let node = Node(nums[i], prev: prev, next: nil)
                prev.next = node
                prev = node
            }

            while !isSorted(dummy.next!) {
                var minSum: Int = Int.max
                var node1: Node? = nil
                var node2: Node? = nil

                var curr = dummy.next!
                while curr.next != nil {
                    let next = curr.next!
                    let sum = curr.val + next.val
                    if sum < minSum {
                        minSum = sum
                        node1 = curr
                        node2 = next
                    }
                    curr = next
                }

                if let node1, let node2 {
                    result += 1
                    node1.val = node1.val + node2.val
    
                    let next = node2.next
                    node1.next = next
                    next?.prev = node1
                }
            }
            return result
        }

        private func isSorted(_ startNode: Node) -> Bool {
            var curr = startNode
            while curr.next != nil {
                let next = curr.next!
                if curr.val > next.val {
                    return false
                }
                curr = next
            }
            return true
        }
    }
*/
