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

    func testSolution_mergeKLists() {
        // given
        let lists1: [ListNode?] = [ListNode(1, ListNode(4, ListNode(5))), ListNode(1, ListNode(3, ListNode(4))), ListNode(2, ListNode(6))]
        let lists2: [ListNode?] = []

        // when
        let result1 = sut.mergeKLists(lists1)
        let result2 = sut.mergeKLists(lists2)

        // then
        let expected1: ListNode? = ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(4, ListNode(5, ListNode(6))))))))
        let expected2: ListNode? = nil

        XCTAssertTrue(areTwoLinkedListsEqual(result1, expected1))
        XCTAssertTrue(areTwoLinkedListsEqual(result2, expected2))
    }
}

extension SolutionTests {
    func areTwoLinkedListsEqual(_ head1: ListNode?, _ head2: ListNode?) -> Bool {
        var head1: ListNode? = head1
        var head2: ListNode? = head2

        while head1 != nil || head2 != nil {
            if head1?.val != head2?.val {
                return false
            }
            head1 = head1?.next
            head2 = head2?.next
        }

        return true
    }
}
