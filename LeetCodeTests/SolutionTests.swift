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

    func testSolution_generateParentheses() {
        // given
        let n1 = 3
        let n2 = 1

        // when
        let result1 = sut.generateParenthesis(n1)
        let result2 = sut.generateParenthesis(n2)

        // then
        let expected1 = ["((()))","(()())","(())()","()(())","()()()"]
        let expected2 = ["()"]

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
    }
}
