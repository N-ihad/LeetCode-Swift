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

    func testSolution_backspaceCompare() {
        // given
        let s1 = "ab#c"
        let t1 = "ad#c"

        let s2 = "ab##"
        let t2 = "c#d#"

        let s3 = "a#c"
        let t3 = "b"

        let s4 = "a##c"
        let t4 = "#a#c"

        // when
        let result1 = sut.backspaceCompare(s1, t1)
        let result2 = sut.backspaceCompare(s2, t2)
        let result3 = sut.backspaceCompare(s3, t3)
        let result4 = sut.backspaceCompare(s4, t4)

        // then
        let expected1 = true
        let expected2 = true
        let expected3 = false
        let expected4 = true

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
        XCTAssertEqual(result4, expected4)
    }
}
