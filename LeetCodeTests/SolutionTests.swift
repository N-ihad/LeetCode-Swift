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

    func testSolution_hasPathSum_1() {
        // given
        let root = TreeNode(5, TreeNode(4, TreeNode(11, TreeNode(7), TreeNode(2))), TreeNode(8, TreeNode(13), TreeNode(4, nil, TreeNode(1))))

        // when
        let result = sut.hasPathSum(root, 22)

        // then
        let expected = true

        XCTAssertEqual(result, expected)
    }

    func testSolution_hasPathSum_2() {
        // given
        let root = TreeNode(1, TreeNode(2), TreeNode(3))

        // when
        let result = sut.hasPathSum(root, 5)

        // then
        let expected = false

        XCTAssertEqual(result, expected)
    }

    func testSolution_hasPathSum_3() {
        // given
        let root: TreeNode? = nil

        // when
        let result = sut.hasPathSum(root, 0)

        // then
        let expected = false

        XCTAssertEqual(result, expected)
    }
}
