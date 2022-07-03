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

    func testSolution_permute() {
        // given
        let nums1 = [1,1,2]
        let nums2 = [1,2,3]

        // when
        let result1 = sut.permuteUnique(nums1)
        let result2 = sut.permuteUnique(nums2)

        // then
        let expected1 = [[1,1,2],
                         [1,2,1],
                         [2,1,1]]
        let expected2 = [[1,2,3],
                         [1,3,2],
                         [2,1,3],
                         [2,3,1],
                         [3,1,2],
                         [3,2,1]]

        XCTAssertEqual(result1, expected1) 
//        XCTAssertEqual(result2, expected2)
    }
}
