//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/find-smallest-letter-greater-than-target/solutions/7540356/swift-solution-using-binary-search-with-0r9pq

    # Approach
    Since the array is sorted, we use binary search to find the smallest character that is strictly greater than the target. 
    Whenever we find a character greater than the target, we store it as a potential answer and continue searching on the left side to see if 
    there is a smaller valid character. If no such character exists, we return the first character in the array.

    ## Main Key Ideas
    - The array is sorted, so we can apply binary search.
    - If `letters[mid] > target`, it is a candidate answer:
      - Store it.
      - Move left (`r = mid - 1`) to find a smaller valid character.
    - If `letters[mid] <= target`, move right (`l = mid + 1`).
    - If no character greater than `target` is found, return `letters[0]` (wrap-around case).
    - `minChar` keeps track of the smallest valid character found during the search.

    # Complexity
    - Time complexity: $O(\log n)$, we only perform binary search.
    - Space complexity: $O(1)$
*/

class Solution {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        var minChar: Character?
        var (l, r) = (0, letters.count-1)
        while l <= r {
            let mid = (l + r) / 2
            if letters[mid] > target {
                minChar = minChar == nil ? letters[mid] : min(minChar!, letters[mid])
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return minChar ?? letters.first!
    }
}
