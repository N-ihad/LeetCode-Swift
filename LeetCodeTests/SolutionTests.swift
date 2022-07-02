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

    func testSolution_permutations() {
        // given
        let nums1 = [1, 2, 3]
        let nums2 = [0, 1]
        let nums3 = [1]

        // when
        let result1 = sut.permute(nums1)
        let result2 = sut.permute(nums2)
        let result3 = sut.permute(nums3)

        // then
        let expected1 = [[3, 2, 1], [2, 3, 1], [1, 3, 2], [3, 1, 2], [2, 1, 3], [1, 2, 3]]
        let expected2 = [[1, 0], [0, 1]]
        let expected3 = [[1]]
        XCTAssertEqual(Set<[Int]>(result1), Set<[Int]>(expected1))
        XCTAssertEqual(Set<[Int]>(result2), Set<[Int]>(expected2))
        XCTAssertEqual(Set<[Int]>(result3), Set<[Int]>(expected3))
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
}
