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

    func testSolution_invertTree_1() {
        // given
        let root = TreeNode(4, TreeNode(2, TreeNode(1), TreeNode(3)), TreeNode(7, TreeNode(6), TreeNode(9)))

        // when
        let result = Helper.treeString(sut.invertTree(root))

        // then
        let expected = Helper.treeString(TreeNode(4, TreeNode(7, TreeNode(9), TreeNode(6)), TreeNode(2, TreeNode(3), TreeNode(1))))

        XCTAssertEqual(result, expected)
    }

    func testSolution_invertTree_2() {
        // given
        let root = TreeNode(2, TreeNode(1), TreeNode(3))

        // when
        let result = Helper.treeString(sut.invertTree(root))

        // then
        let expected = Helper.treeString(TreeNode(2, TreeNode(3), TreeNode(1)))

        XCTAssertEqual(result, expected)
    }

    func testSolution_invertTree_3() {
        // given
        let root: TreeNode? = nil

        // when
        let result = Helper.treeString(sut.invertTree(root))

        // then
        let expected = Helper.treeString(nil)

        XCTAssertEqual(result, expected)
    }
}
