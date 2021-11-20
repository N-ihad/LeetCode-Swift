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

    func testSolution_isValidParentheses() {
        // given
        let parenthesis1 = "()"
        let parenthesis2 = "()[]{}"
        let parenthesis3 = "(]"
        let parenthesis4 = "([)]"
        let parenthesis5 = "{[]}"
        let parenthesis6 = "(("
        let parenthesis7 = "("

        // when
        let result1 = sut.isValid(parenthesis1)
        let result2 = sut.isValid(parenthesis2)
        let result3 = sut.isValid(parenthesis3)
        let result4 = sut.isValid(parenthesis4)
        let result5 = sut.isValid(parenthesis5)
        let result6 = sut.isValid(parenthesis6)
        let result7 = sut.isValid(parenthesis7)

        // then
        XCTAssertEqual(result1, true)
        XCTAssertEqual(result2, true)
        XCTAssertEqual(result3, false)
        XCTAssertEqual(result4, false)
        XCTAssertEqual(result5, true)
        XCTAssertEqual(result6, false)
        XCTAssertEqual(result7, false)
    }

//    func testPerformanceExample() throws {
//        measure {
//            sut.isValid("{{{{{{{{{{{{{{{{")
//        }
//    }
}
