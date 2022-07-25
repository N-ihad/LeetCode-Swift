//
//  SolutionTests.swift
//  LeetCodeTests
//
//  Created by Nihad on 11/20/21.
//

import XCTest
@testable import LeetCode

class SolutionTests: XCTestCase {

    var sut: Solution!

    override func setUp() {
        super.setUp()
        sut = Solution()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testSolution_lengthOfLongestSubstring() {
        // given
        let str1 = "abcabcbb"
        let str2 = "bbbbb"
        let str3 = "pwwkew"
        let str4 = "aab"
        let str5 = "dvdf"
        let str6 = "cdd"
        let str7 = "abba"

        // when
        let result1 = sut.lengthOfLongestSubstring(str1)
        let result2 = sut.lengthOfLongestSubstring(str2)
        let result3 = sut.lengthOfLongestSubstring(str3)
        let result4 = sut.lengthOfLongestSubstring(str4)
        let result5 = sut.lengthOfLongestSubstring(str5)
        let result6 = sut.lengthOfLongestSubstring(str6)
        let result7 = sut.lengthOfLongestSubstring(str7)

        // then
        let expected1 = 3
        let expected2 = 1
        let expected3 = 3
        let expected4 = 2
        let expected5 = 3
        let expected6 = 2
        let expected7 = 2

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
        XCTAssertEqual(result4, expected4)
        XCTAssertEqual(result5, expected5)
        XCTAssertEqual(result6, expected6)
        XCTAssertEqual(result7, expected7)
    }
}
