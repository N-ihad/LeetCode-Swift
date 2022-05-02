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

    func testSolution_isAnagram() {
        // given
        let s1 = "anagram"
        let t1 = "nagaram"

        let s2 = "rat"
        let t2 = "car"

        let s3 = "ab"
        let t3 = "a"

        // when
        let result1 = sut.isAnagram(s1, t1)
        let result2 = sut.isAnagram(s2, t2)
        let result3 = sut.isAnagram(s3, t3)

        // then
        let expected1 = true
        let expected2 = false
        let expected3 = false

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
    }
}
