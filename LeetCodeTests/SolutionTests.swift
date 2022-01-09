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

    func testSolution_removeElement() {
        // given
        var nums1 = [3,2,2,3]
        let val1 = 3

        var nums2 = [0,1,2,2,3,0,4,2]
        let val2 = 2

        // when
        let k1 = sut.removeElement(&nums1, val1)
        let k2 = sut.removeElement(&nums2, val2)

        // then
        let expected1 = [2,2,0,0]
        let kk1 = 2

        let expected2 = [0,1,3,0,4,0,0,0]
        let kk2 = 5

        XCTAssertEqual(k1, kk1)
        XCTAssertEqual(k2, kk2)
        XCTAssertEqual(nums1[0..<kk1], expected1[0..<k1])
        XCTAssertEqual(nums2[0..<kk2], expected2[0..<k2])
    }
}
