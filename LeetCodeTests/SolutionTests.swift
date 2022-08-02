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

    func testSolution_inorderTraversal_1() {
        // given
        let root: TreeNode? = TreeNode(1, nil, TreeNode(2, TreeNode(3)))

        // when
        let result = sut.inorderTraversal(root)

        // then
        let expected = [1,3,2]

        XCTAssertEqual(result, expected)
    }

    func testSolution_inorderTraversal_2() {
        // given
        let root: TreeNode? = nil

        // when
        let result = sut.inorderTraversal(root)

        // then
        let expected: [Int] = []

        XCTAssertEqual(result, expected)
    }

    func testSolution_inorderTraversal_3() {
        // given
        let root: TreeNode? = TreeNode(1)

        // when
        let result = sut.inorderTraversal(root)

        // then
        let expected = [1]

        XCTAssertEqual(result, expected)
    }

    func testSolution_inorderTraversal_4() {
        // given
        let root: TreeNode? = TreeNode(3, TreeNode(1), TreeNode(2))

        // when
        let result = sut.inorderTraversal(root)

        // then
        let expected = [1,3,2]

        XCTAssertEqual(result, expected)
    }
}
