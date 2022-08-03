//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

class Solution {
    class MyCalendar {

        var bookings: [[Int]] = []

        init() {

        }

        func book(_ start: Int, _ end: Int) -> Bool {
            for booking in bookings where max(booking[0], start) < min(booking[1], end) {
                return false
            }
            bookings.append([start,end])
            return true
        }
    }
}
