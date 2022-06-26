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

    func testSolution_combinations() {
        // given
        let n1 = 4
        let k1 = 2

        let n2 = 1
        let k2 = 1

        // when
        let result1 = sut.combine(n1, k1)
        let result2 = sut.combine(n2, k2)

        // then
        let expected1 = [
            [2,4],
            [3,4],
            [2,3],
            [1,2],
            [1,3],
            [1,4],
        ]
        let expected2 = [[1]]

        XCTAssertEqual(Set<[Int]>(result1), Set<[Int]>(expected1))
        XCTAssertEqual(Set<[Int]>(result2), Set<[Int]>(expected2))
    }
}
