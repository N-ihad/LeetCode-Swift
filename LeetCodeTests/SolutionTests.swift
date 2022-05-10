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

    func testSolution_firstUniqChar() {
        // given
        let s1 = "leetcode"
        let s2 = "loveleetcode"
        let s3 = "aabb"

        // when
        let result1 = sut.firstUniqChar(s1)
        let result2 = sut.firstUniqChar(s2)
        let result3 = sut.firstUniqChar(s3)

        // then
        let expected1 = 0
        let expected2 = 2
        let expected3 = -1

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
    }
}
