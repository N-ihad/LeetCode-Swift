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

    func testSolution_kthSmallest() {
        // given
        let root1 = TreeNode(3, TreeNode(1, nil, TreeNode(2)), TreeNode(4))
        let k1 = 1

        let root2 = TreeNode(5, TreeNode(3, TreeNode(2, TreeNode(1)), TreeNode(4)), TreeNode(6))
        let k2 = 3

        // when
        let result1 = sut.kthSmallest(root1, k1)
        let result2 = sut.kthSmallest(root2, k2)

        // then
        let expected1 = 1
        let expected2 = 3

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
    }
}
