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

    func testSolution_sumNumbers_1() {
        // given
        let root = TreeNode(1, TreeNode(2), TreeNode(3))

        // when
        let result = sut.sumNumbers(root)

        // then
        let expected = 25

        XCTAssertEqual(result, expected)
    }

    func testSolution_sumNumbers_2() {
        // given
        let root = TreeNode(4, TreeNode(9, TreeNode(5), TreeNode(1)), TreeNode(0))

        // when
        let result = sut.sumNumbers(root)

        // then
        let expected = 1026

        XCTAssertEqual(result, expected)
    }
}
