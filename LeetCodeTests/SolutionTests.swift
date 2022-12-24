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

    func testSolution_levelOrderBottom_1() {
        // given
        let root = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))

        // when
        let expected = [[15,7],[9,20],[3]]

        // then
        let result = sut.levelOrderBottom(root)

        XCTAssertEqual(expected, result)
    }

    func testSolution_levelOrderBottom_2() {
        // given
        let root = TreeNode(1)

        // when
        let expected = [[1]]

        // then
        let result = sut.levelOrderBottom(root)

        XCTAssertEqual(expected, result)
    }

    func testSolution_levelOrderBottom_3() {
        // given
        let root: TreeNode? = nil

        // when
        let expected: [[Int]] = []

        // then
        let result = sut.levelOrderBottom(root)

        XCTAssertEqual(expected, result)
    }
}
