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

    func testSolution_hasCycle() {
        // given
        let node11: ListNode? = ListNode(3)
        let node12: ListNode? = ListNode(2)
        let node13: ListNode? = ListNode(0)
        let node14: ListNode? = ListNode(-4)
        node11?.next = node12
        node12?.next = node13
        node13?.next = node14
        node14?.next = node12

        let node21: ListNode? = ListNode(1)
        let node22: ListNode? = ListNode(2)
        node21?.next = node22
        node22?.next = node21

        let node31: ListNode? = ListNode(1)

        // when
        let result1 = sut.hasCycle(node11)
        let result2 = sut.hasCycle(node21)
        let result3 = sut.hasCycle(node31)

        // then
        let expected1 = true
        let expected2 = true
        let expected3 = false

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
    }
}
