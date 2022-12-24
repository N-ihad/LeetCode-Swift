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

    func testSolution_isSameTree_1() {
        // given
        let root1 = TreeNode(1, TreeNode(2), TreeNode(3))
        let root2 = TreeNode(1, TreeNode(2), TreeNode(3))

        // when
        let result = sut.isSameTree(root1, root2)

        // then
        let expected = true

        XCTAssertEqual(result, expected)
    }

    func testSolution_isSameTree_2() {
        // given
        let root1 = TreeNode(1, TreeNode(2))
        let root2 = TreeNode(1, nil, TreeNode(2))

        // when
        let result = sut.isSameTree(root1, root2)

        // then
        let expected = false

        XCTAssertEqual(result, expected)
    }

    func testSolution_isSameTree_3() {
        // given
        let root1 = TreeNode(1, TreeNode(2), TreeNode(1))
        let root2 = TreeNode(1, TreeNode(1), TreeNode(2))

        // when
        let result = sut.isSameTree(root1, root2)

        // then
        let expected = false

        XCTAssertEqual(result, expected)
    }
}
