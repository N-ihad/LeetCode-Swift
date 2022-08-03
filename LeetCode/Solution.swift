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

            if bookings.count == 0 {
                bookings.append([start, end])
                return true
            }

            for i in 0..<bookings.count {
                if (start < bookings[i][1] && start >= bookings[i][0]) ||
                   (end > bookings[i][0] && end <= bookings[i][1]) ||
                   (start <= bookings[i][0] && end >= bookings[i][1]) {
                    return false
                }
            }

            for i in 0..<bookings.count {
                if start < bookings[i][0] {
                    bookings.insert([start, end], at: i)
                    return true
                }
            }

            bookings.append([start, end])
            return true
        }
    }
}
