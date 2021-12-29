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

    func testSolution_maxDepth() {
        // given
        let root1 = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
        let root2 = TreeNode(1, nil, TreeNode(2))

        // when
        let result1 = sut.maxDepth(root1)
        let result2 = sut.maxDepth(root2)

        // then
        let expected1 = 3
        let expected2 = 2

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
    }
}
