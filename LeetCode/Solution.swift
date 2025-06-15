//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/max-difference-you-can-get-from-changing-an-integer/solutions/6847322/swift-solution-with-explanation-by-nihad-qbw2

    # Approach
    The function `maxDiff` computes the **maximum difference** you can obtain by remapping one digit to another in a given integer `num` — twice, independently. In each transformation, you choose one digit `x` and replace all its occurrences with another digit `y`. The constraint is that the resulting numbers must **not contain leading zeros** and must **remain valid integers** (non-zero).

    ### Step-by-step Explanation:

    1. **Convert to Array of Characters:**
       The number `num` is converted to a character array for easier digit-wise manipulation.

    2. **Prepare Variants:**
       The function builds three variations of the number:
       - `maxNum`: attempts to **maximize** the number by replacing one digit with `'9'`.
       - `minNum1` and `minNum2`: attempt to **minimize** the number by replacing a digit with `'0'` or `'1'`, depending on leading-zero restrictions.

    3. **Digit Selection and Remapping:**
       The loop processes each digit and determines:
       - `chosenDigitForMaxNum`: the first digit that is not `'9'`. All such digits are replaced with `'9'` to get the largest possible number.
       - `chosenDigitForMinNum1`: a digit **not in the first position** and **not equal to the first digit or '0'** — replacing it with `'0'` avoids creating a number with leading zeros.
       - `chosenDigitForMinNum2`: simply the first digit in the number. All its occurrences are replaced with `'1'` to minimize the number while ensuring the result is still valid (no leading zero).

    4. **Apply Replacements:**
       For each variant, if a digit matches the chosen digit, it is replaced in the corresponding array. This step generates transformed versions of the number for max and min scenarios.

    5. **Convert Back and Compare:**
       All variants are joined back into strings and converted to integers. The final result is the **maximum difference** between the maximized version and the two minimized versions (`max - min1`, `max - min2`).

    6. **Return the Maximum Difference:**
       This ensures we find the largest gap possible from any valid one-digit remapping.

    ### Time Complexity:
    - $O(n)$ where $n$ is the number of digits in `num`.

    ### Space Complexity:
    - $O(n)$ for storing character arrays of digits and their modified variants.
*/

class Solution {
    func maxDiff(_ num: Int) -> Int {
        let num = Array(String(num))
        var (maxNum, minNum1, minNum2) = (num, num, num)
        var (chosenDigitForMaxNum, chosenDigitForMinNum1, chosenDigitForMinNum2): (Character?, Character?, Character?)
        for i in 0..<num.count {
            if chosenDigitForMaxNum == nil && num[i] != "9" {
                chosenDigitForMaxNum = num[i]
            }

            if chosenDigitForMinNum1 == nil && i > 0 && num[i] != num[0] && num[i] != "0" {
                chosenDigitForMinNum1 = num[i]
            }

            if chosenDigitForMinNum2 == nil {
                chosenDigitForMinNum2 = num[i]
            }

            if chosenDigitForMaxNum == num[i] {
                maxNum[i] = "9"
            }
            
            if chosenDigitForMinNum1 == num[i] {
                minNum1[i] = "0"
            }

            if chosenDigitForMinNum2 == num[i] {
                minNum2[i] = "1"
            }
        }

        let max = Int(maxNum.reduce("", { $0 + String($1) }))!
        let min1 = Int(minNum1.reduce("", { $0 + String($1) }))!
        let min2 = Int(minNum2.reduce("", { $0 + String($1) }))!

        return Swift.max(max - min1, max - min2)
    }
}
