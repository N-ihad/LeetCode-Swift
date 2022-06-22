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

    func testSolution_combinationSum2() {
        // given
        let candidates1 = [10,1,2,7,6,1,5]
        let target1 = 8

        let candidates2 = [2,5,2,1,2]
        let target2 = 5

        // when
        let result1 = sut.combinationSum2(candidates1, target1)
        let result2 = sut.combinationSum2(candidates2, target2)

        // then
        let expected1 = [[1,1,6],[1,2,5],[1,7],[2,6]]
        let expected2 = [[1,2,2],[5]]

        XCTAssertEqual(Set<Array<Int>>(result1), Set<Array<Int>>(expected1))
        XCTAssertEqual(Set<Array<Int>>(result2), Set<Array<Int>>(expected2))
    }
}
