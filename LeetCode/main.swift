//
//  main.swift
//  LeetCode
//
//  Created by Nihad on 11/17/21.
//

import Foundation

// I 1 **
// V 5 
// X 10 **
// L 50
// C 100 **
// D 500
// M 1000

func romanToInt(_ s: String) -> Int {
    let romanNumbers: [String: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
    var number = 0

    for i in 0..<s.count {
        let currentChar = String(s[s.index(s.startIndex, offsetBy: i)])
        let currentInt = romanNumbers[currentChar]!

        if i == s.count - 1 {
            number += currentInt
            break
        }

        let nextChar = String(s[s.index(s.startIndex, offsetBy: i + 1)])
        let nextInt = romanNumbers[nextChar]!

        if currentInt < nextInt {
            number += -currentInt
        } else {
            number += currentInt
        }
    }

    return number
}
