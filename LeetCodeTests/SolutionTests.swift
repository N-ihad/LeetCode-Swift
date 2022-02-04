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

    func testSolution_zigzagLevelOrder() {
        // given
        let root1 = TreeNode(1, TreeNode(2, TreeNode(4)), TreeNode(3, nil, TreeNode(5)))
        let root2 = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
        let root3 = TreeNode(1)
        let root4: TreeNode? = nil

        // when
        let result1 = sut.zigzagLevelOrder(root1)
        let result2 = sut.zigzagLevelOrder(root2)
        let result3 = sut.zigzagLevelOrder(root3)
        let result4 = sut.zigzagLevelOrder(root4)

        // then
        let expected1 = [[1], [3, 2], [4, 5]]
        let expected2 = [[3], [20, 9], [15, 7]]
        let expected3 = [[1]]
        let expected4 = [[Int]]()

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
        XCTAssertEqual(result4, expected4)
    }
}
