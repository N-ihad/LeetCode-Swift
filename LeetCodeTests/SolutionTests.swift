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

    func testSolution_reverseLinkedList() {
        // given
        let head1 = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, nil)))))
        let head2 = ListNode(1, ListNode(2, nil))
        let head3: ListNode? = nil

        // when
        let result1 = sut.reverseList(head1)
        let result2 = sut.reverseList(head2)
        let result3 = sut.reverseList(head3)

//        // then
//        let expected1 = ListNode(5, ListNode(4, ListNode(3, ListNode(2, ListNode(1, nil)))))
//        let expected2 = ListNode(2, ListNode(1, nil))
//        let expected3: ListNode? = nil

        printList(result1, label: "result1, should be 5 4 3 2 1")
        printList(result2, label: "result2, should be 2 1")
        printList(result3, label: "result3, should be empty")
    }

    func printList(_ head: ListNode?, label: String) {
        var head = head
        print("***** \(label) *****")
        while head != nil {
            print(head!.val, terminator: " ")
            head = head!.next
        }
        print("\n***** \(label) *****")
        print()
    }
}
