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

    func testSolution_removeDuplicatesFromSortedArray() {
        // given
        var nums1 = [1,1,2]
        var nums2 = [0,0,1,1,1,2,2,3,3,4]

        // when
        let k1 = sut.removeDuplicates(&nums1)
        let k2 = sut.removeDuplicates(&nums2)

        // then
        let expected1 = [1, 2, 0]
        let expected2 = [0, 1, 2, 3, 4, 0, 0, 0, 0, 0]

        XCTAssertEqual(nums1[0..<k1], expected1[0..<k1])
        XCTAssertEqual(nums2[0..<k2], expected2[0..<k2])
    }
}
