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

    func testSolution_partition() {
        let s1 = "aab"
        let s2 = "a"

        let result1 = sut.partition(s1)
        let result2 = sut.partition(s2)

        let expected1 = [["a","a","b"],["aa","b"]]
        let expected2 = [["a"]]

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
    }
}
