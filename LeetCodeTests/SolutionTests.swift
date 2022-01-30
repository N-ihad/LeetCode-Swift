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

    func testSolution_findDuplicate() {
        // given
        let nums1 = [2,5,9,6,9,3,8,9,7,1]
        let nums2 = [1,3,4,2,2]
        let nums3 = [3,1,3,4,2]

        // when
        let result1 = sut.findDuplicate(nums1)
        let result2 = sut.findDuplicate(nums2)
        let result3 = sut.findDuplicate(nums3)

        // then
        let expected1 = 9
        let expected2 = 2
        let expected3 = 3

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
    }
}
