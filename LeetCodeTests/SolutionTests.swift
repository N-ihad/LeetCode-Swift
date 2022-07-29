//
//  SolutionTests.swift
//  LeetCodeTests
//
//  Created by Nihad on 11/20/21.
//

import XCTest
@testable import LeetCode

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */

class SolutionTests: XCTestCase {

    var sut: LRUCache!

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testSolution_LRUCache_get_1() {
        // given
        let lruCache = LRUCache(4)

        // when
        let result = lruCache.get(2)

        // then
        let expected = -1

        XCTAssertEqual(result, expected)
    }

    func testSolution_LRUCache_get_2() {
        // given
        let lruCache = LRUCache(4)
        lruCache.put(1, 1)

        // when
        let result = lruCache.get(2)

        // then
        let expected = -1

        XCTAssertEqual(result, expected)
    }

    func testSolution_LRUCache_get_3() {
        // given
        let lruCache = LRUCache(4)
        lruCache.put(2, 2)

        // when
        let result = lruCache.get(2)

        // then
        let expected = 2

        XCTAssertEqual(result, expected)
    }

    func testSolution_LRUCache_get_4() {
        // given
        let lruCache = LRUCache(4)
        lruCache.put(1, 1)
        lruCache.put(2, 2)
        lruCache.put(3, 3)

        // when
        let result = lruCache.get(2)

        // then
        let expected = 2

        XCTAssertEqual(result, expected)
    }

    func testSolution_LRUCache_get_5() {
        // given
        let lruCache = LRUCache(4)
        lruCache.put(1, 1)
        lruCache.put(2, 2)
        lruCache.put(3, 3)
        lruCache.put(4, 4)

        // when
        let result = lruCache.get(2)

        // then
        let expected = 2

        XCTAssertEqual(result, expected)
    }

    func testSolution_LRUCache_get_6() {
        // given
        let lruCache = LRUCache(4)
        lruCache.put(2, 2)
        lruCache.put(1, 1)
        lruCache.put(3, 3)
        lruCache.put(4, 4)

        // when
        let result = lruCache.get(2)

        // then
        let expected = 2

        XCTAssertEqual(result, expected)
    }

    func testSolution_LRUCache_get_7() {
        // given
        let lruCache = LRUCache(4)
        lruCache.put(1, 1)
        lruCache.put(3, 3)
        lruCache.put(4, 4)
        lruCache.put(2, 2)

        // when
        let result = lruCache.get(2)

        // then
        let expected = 2

        XCTAssertEqual(result, expected)
    }

    func testSolution_LRUCache_get_8() {
        // given
        let lruCache = LRUCache(4)
        lruCache.put(1, 1)
        lruCache.put(3, 3)
        lruCache.put(4, 4)
        lruCache.put(2, 2)

        // when
        let result = lruCache.get(2)

        // then
        let expected = 2

        XCTAssertEqual(result, expected)
    }

    func testSolution_LRUCache_get_9() {
        // given
        let lruCache = LRUCache(4)
        lruCache.put(1, 1)
        lruCache.put(3, 3)
        lruCache.put(4, 4)
        lruCache.put(2, 2)

        // when
        let result = lruCache.get(0)

        // then
        let expected = -1

        XCTAssertEqual(result, expected)
    }

    func testSolution_LRUCache_1() {
        // given
        let lruCache = LRUCache(1)

        // when
        lruCache.put(2, 1)
        printList(lruCache.list.head!)
        lruCache.get(2)
        printList(lruCache.list.head!)
        lruCache.put(3, 2)
        printList(lruCache.list.head!)
        lruCache.get(2)
        printList(lruCache.list.head!)
        lruCache.get(3)
        printList(lruCache.list.head!)
    }

    func printList(_ root: Node?) {
        if root == nil { print("Empty list"); return }
        var head = root
        while head != nil {
            print("\(head!.value)", terminator: " ")
            head = head?.next
        }
        print()
    }
}
