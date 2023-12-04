//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    func largestGoodInteger(_ num: String) -> String {
        var result: String = ""
        var temp: String = ""

        for char in num {
            if temp.count == 3 {

                if result.isEmpty || Int(temp)! > Int(result)! {
                    result = temp
                }

                temp = ""
            }

            if char == temp.first {
                temp += String(char)
            } else {
                temp = String(char)
            }
        }

        if temp.count == 3 && (result.isEmpty || Int(temp)! > Int(result)!) {
            result = temp
        }

        return result
    }
}
