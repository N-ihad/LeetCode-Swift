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

    func testSolution_() {
        // given
        let numCourses1 = 2
        let prerequisites1 = [[1, 0]]

        let numCourses2 = 2
        let prerequisites2 = [[1, 0], [0, 1]]

        // when
        let result1 = sut.canFinish(numCourses1, prerequisites1)
        let result2 = sut.canFinish(numCourses2, prerequisites2)

        // then
        let expected1 = true
        let expected2 = false

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
    }
}
