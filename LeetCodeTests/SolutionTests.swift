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

    func testSolution_integerToRoman() {
        // given
        let num1 = 3
        let num2 = 4
        let num3 = 9
        let num4 = 58

        // when
        let result1 = sut.intToRoman(num1)
        let result2 = sut.intToRoman(num2)
        let result3 = sut.intToRoman(num3)
        let result4 = sut.intToRoman(num4)

        // then
        XCTAssertEqual(result1, "III")
        XCTAssertEqual(result2, "IV")
        XCTAssertEqual(result3, "IX")
        XCTAssertEqual(result4, "LVIII")
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
}
