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

    func testSolution_findBottomLeftValue_1() {
        // given
        let root = TreeNode(2, TreeNode(1), TreeNode(3))

        // when
        let result = sut.findBottomLeftValue(root)

        // then
        let expected = 1

        XCTAssertEqual(result, expected)
    }

    func testSolution_findBottomLeftValue_2() {
        // given
        let root = TreeNode(1, TreeNode(2, TreeNode(4)), TreeNode(3, TreeNode(5, TreeNode(7)), TreeNode(6)))

        // when
        let result = sut.findBottomLeftValue(root)

        // then
        let expected = 7

        XCTAssertEqual(result, expected)
    }

    func testSolution_findBottomLeftValue_3() {
        // given
        let root = TreeNode(0)

        // when
        let result = sut.findBottomLeftValue(root)

        // then
        let expected = 0

        XCTAssertEqual(result, expected)
    }
}
