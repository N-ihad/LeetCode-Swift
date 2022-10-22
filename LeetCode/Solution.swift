//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func reverse(_ x: Int) -> Int {
        let MIN_32_INT = -2147483648
        let MAX_32_INT = 2147483647

        var newNumber = 0
        var digitsCountInMultiplesOfTen = 0

        var trailingZeroFlag = true
        var (mFraction, mInt) = (10, 1)

        while x / mInt != 0 {
            let digit = (x % mFraction) / mInt

            if trailingZeroFlag,
               digit != 0 {
                trailingZeroFlag.toggle()
                digitsCountInMultiplesOfTen = 1
                (mFraction, mInt) = (mFraction * 10, mInt * 10)
                continue
            }

            if !trailingZeroFlag {
                digitsCountInMultiplesOfTen *= 10
            }

            (mFraction, mInt) = (mFraction * 10, mInt * 10)
        }

        trailingZeroFlag = true
        (mFraction, mInt) = (10, 1)

        while x / mInt != 0 {
            let digit = (x % mFraction) / mInt
            if trailingZeroFlag,
               digit != 0 {
                trailingZeroFlag.toggle()
            }

            if !trailingZeroFlag {
                newNumber += digit * digitsCountInMultiplesOfTen
                digitsCountInMultiplesOfTen /= 10
            }

            (mFraction, mInt) = (mFraction * 10, mInt * 10)
        }

        return (newNumber >= MIN_32_INT && newNumber <= MAX_32_INT) ? newNumber : 0
    }
}
