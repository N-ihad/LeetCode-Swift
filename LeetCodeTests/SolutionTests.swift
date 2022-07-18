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

    func testSolution_maxPathSum() {
        // given
        let root1 = TreeNode(1, TreeNode(2), TreeNode(3))
        let root2 = TreeNode(-10, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
        let root3 = TreeNode(2, TreeNode(-1))
        let root4 = TreeNode(1, TreeNode(-2), TreeNode(3))
        let root5 = TreeNode(9, TreeNode(6), TreeNode(-3, TreeNode(-6), TreeNode(2, TreeNode(2, TreeNode(-6, TreeNode(-6)), TreeNode(-6)))))

        // when
        let result1 = sut.maxPathSum(root1)
        let result2 = sut.maxPathSum(root2)
        let result3 = sut.maxPathSum(root3)
        let result4 = sut.maxPathSum(root4)
        let result5 = sut.maxPathSum(root5)

        // then
        let expected1 = 6
        let expected2 = 42
        let expected3 = 2
        let expected4 = 4
        let expected5 = 16

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
        XCTAssertEqual(result4, expected4)
        XCTAssertEqual(result5, expected5)
    }
}
