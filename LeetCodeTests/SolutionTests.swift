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

    func testSolution_topKFrequent() {
        // given
        let nums1 = [1,1,1,2,2,3]
        let k1 = 2

        let nums2 = [1]
        let k2 = 1

        // when
        let result1 = sut.topKFrequent(nums1, k1)
        let result2 = sut.topKFrequent(nums2, k2)

        // then
        let expected1 = [1,2]
        let expected2 = [1]

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
    }
}
