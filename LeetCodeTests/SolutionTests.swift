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

    func testSolution_lengthOfLastWord() {
        // given
        let str1 = "Hello World"
        let str2 = "   fly me   to   the moon  "
        let str3 = "luffy is still joyboy"

        // when
        let result1 = sut.lengthOfLastWord(str1)
        let result2 = sut.lengthOfLastWord(str2)
        let result3 = sut.lengthOfLastWord(str3)

        // then
        XCTAssertEqual(result1, 5)
        XCTAssertEqual(result2, 4)
        XCTAssertEqual(result3, 6)
    }

//    func testPerformanceExample() throws {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
}
