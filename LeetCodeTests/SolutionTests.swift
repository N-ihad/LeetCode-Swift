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

    func testSolution_combinationSum() {
        // given
        let candidates1 = [2, 3, 6, 7]
        let target1 = 7
        let candidates2 = [2, 3, 5]
        let target2 = 8
        let candidates3 = [2]
        let target3 = 1
        let candidates4 = [1]
        let target4 = 1
        let candidates5 = [1]
        let target5 = 2

        // when
        let result1 = sut.combinationSum(candidates1, target1)
        let result2 = sut.combinationSum(candidates2, target2)
        let result3 = sut.combinationSum(candidates3, target3)
        let result4 = sut.combinationSum(candidates4, target4)
        let result5 = sut.combinationSum(candidates5, target5)

        // then
        XCTAssertEqual(result1, [[2, 2, 3], [7]])
        XCTAssertEqual(result2, [[2, 2, 2, 2], [2, 3, 3], [3, 5]])
        XCTAssertEqual(result3, [])
        XCTAssertEqual(result4, [[1]])
        XCTAssertEqual(result5, [[1, 1]])
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
}
