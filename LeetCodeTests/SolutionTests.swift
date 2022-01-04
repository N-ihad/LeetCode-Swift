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

    func testSolution_() {
        // given
        let root1 = TreeNode(1, TreeNode(2, TreeNode(3), TreeNode(4)), TreeNode(2, TreeNode(4), TreeNode(3)))
        let root2 = TreeNode(1, TreeNode(2, nil, TreeNode(3)), TreeNode(2, nil, TreeNode(3)))

        // when
        let result1 = sut.isSymmetric(root1)
        let result2 = sut.isSymmetric(root2)

        // then
        let expected1 = true
        let expected2 = false

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
    }
}
