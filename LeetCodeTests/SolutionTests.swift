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

    func testSolution_addTwoNumbers() {
        // given
        let root11 = ListNode(2, ListNode(4, ListNode(3)))
        let root12 = ListNode(5, ListNode(6, ListNode(4)))

        let root21 = ListNode(0)
        let root22 = ListNode(0)

        let root31 = ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9, ListNode(9)))))))
        let root32 = ListNode(9, ListNode(9, ListNode(9, ListNode(9))))

        // when
        let result1 = sut.addTwoNumbers(root11, root12)
        let result2 = sut.addTwoNumbers(root21, root22)
        let result3 = sut.addTwoNumbers(root31, root32)

        // then
        let expected1 = ListNode(7, ListNode(0, ListNode(8)))
        let expected2 = ListNode(0)
        let expected3 = ListNode(8, ListNode(9, ListNode(9, ListNode(9, ListNode(0, ListNode(0, ListNode(0, ListNode(1))))))))

        printList(result3)
        printList(expected3)
        XCTAssertTrue(compareTwoLists(result1, expected1))
        XCTAssertTrue(compareTwoLists(result2, expected2))
        XCTAssertTrue(compareTwoLists(result3, expected3))
    }

    func printList(_ root: ListNode?) {
        print("[", terminator: "")
        var root = root
        while root != nil {
            print(root!.val, terminator: " ")
            root = root?.next
        }
        print("]", terminator: "")
    }

    func compareTwoLists(_ root1: ListNode?, _ root2: ListNode?) -> Bool {
        var head1: ListNode? = root1
        var head2: ListNode? = root2

        if (head1 == nil && head2 != nil) || (head1 != nil && head2 == nil) {
            return false
        }

        while head1 != nil && head2 != nil {
            if (head1!.val != head2!.val) || (head1!.next == nil && head2!.next != nil) || (head1!.next != nil && head2!.next == nil) {
                return false
            }

            head1 = head1!.next
            head2 = head2!.next
        }

        return true
    }
}
