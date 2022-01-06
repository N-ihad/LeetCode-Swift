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

    func testSolution_reverseString() {
        // given
        let str1 = "the sky is blue"
        let str2 = "  hello world  "
        let str3 = "a good   example"

        // when
        let result1 = sut.reverseWords(str1)
        let result2 = sut.reverseWords(str2)
        let result3 = sut.reverseWords(str3)

        // then
        let expected1 = "blue is sky the"
        let expected2 = "world hello"
        let expected3 = "example good a"

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
    }
}
