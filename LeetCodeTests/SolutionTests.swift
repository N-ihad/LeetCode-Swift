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

    func testSolution_diameterOfBinaryTree() {
        // given
        let root1 = TreeNode(1, TreeNode(2, TreeNode(4), TreeNode(5)), TreeNode(3))
        let root2 = TreeNode(1, TreeNode(2), nil)

        // when
        let result1 = sut.diameterOfBinaryTree(root1)
        let result2 = sut.diameterOfBinaryTree(root2)

        // then
        let expected1 = 3
        let expected2 = 1

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
    }
}
