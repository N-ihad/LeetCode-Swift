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

    func testSolution_productExceptSelf() {
        // given
        let nums1 = [1,2,3,4]
        let nums2 = [-1,1,0,-3,3]

        // when
        let result1 = sut.productExceptSelf(nums1)
        let result2 = sut.productExceptSelf(nums2)

        // then
        let expected1 = [24,12,8,6]
        let expected2 = [0,0,9,0,0]

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
    }
}
