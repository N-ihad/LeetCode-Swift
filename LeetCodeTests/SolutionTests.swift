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

    func testSolution_LRUCache() {
        // given
        sut = LRUCache(2)
        sut.put(1, 1)
        sut.put(2, 2)
        let result1 = sut.get(1)
        sut.put(3, 3)
        let result2 = sut.get(2)
        sut.put(4, 4)
        let result3 = sut.get(1)
        let result4 = sut.get(3)
        let result5 = sut.get(4)

        // then
        let expected1 = 1
        let expected2 = -1
        let expected3 = -1
        let expected4 = 3
        let expected5 = 4

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
        XCTAssertEqual(result4, expected4)
        XCTAssertEqual(result5, expected5)
    }
}
