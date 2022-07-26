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

    func testSolution_isValidBST() {
        // given
        let node1 = TreeNode(1)
        let node2 = TreeNode(2)
        let node3 = TreeNode(3)
        node2.left = node1
        node2.right = node3

        let node11 = TreeNode(1)
        let node13 = TreeNode(3)
        let node14 = TreeNode(4)
        let node15 = TreeNode(5)
        let node16 = TreeNode(6)
        node15.left = node11
        node15.right = node14
        node14.left = node13
        node14.right = node16

        let node25 = TreeNode(5)
        let node24 = TreeNode(4)
        let node26 = TreeNode(6)
        let node23 = TreeNode(3)
        let node27 = TreeNode(7)
        node25.left = node24
        node25.right = node26
        node26.left = node23
        node26.right = node27

        // when
        let result1 = sut.isValidBST(node2)
        let result2 = sut.isValidBST(node15)
        let result3 = sut.isValidBST(node25)

        let expectedResult1 = true
        let expectedResult2 = false
        let expectedResult3 = false

        XCTAssertEqual(result1, expectedResult1)
        XCTAssertEqual(result2, expectedResult2)
        XCTAssertEqual(result3, expectedResult3)
    }
}
