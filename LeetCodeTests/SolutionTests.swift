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

    func testSolution_containsDuplicate() {
        // given
        let nums1 = [1,2,3,1]
        let nums2 = [1,2,3,4]
        let nums3 = [1,1,1,3,3,4,3,2,4,2]

        // when
        let result1 = sut.containsDuplicate(nums1)
        let result2 = sut.containsDuplicate(nums2)
        let result3 = sut.containsDuplicate(nums3)

        // then
        let expected1 = true
        let expected2 = false
        let expected3 = true

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
    }
}
