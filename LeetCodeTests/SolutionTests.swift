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

    func testSolution_longestConsecutive() {
        // given
        let nums1 = [100,4,200,1,3,2]
        let nums2 = [0,3,7,2,5,8,4,6,0,1]

        // when
        let result1 = sut.longestConsecutive(nums1)
        let result2 = sut.longestConsecutive(nums2)

        // then
        let expected1 = 4
        let expected2 = 9

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
    }
}
