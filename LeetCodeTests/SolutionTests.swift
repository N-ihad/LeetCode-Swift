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
        let n1 = 3
        let n2 = 5
        let n3 = 15

        // where
        let result1 = sut.fizzBuzz(n1)
        let result2 = sut.fizzBuzz(n2)
        let result3 = sut.fizzBuzz(n3)

        // expected
        let expected1 = ["1","2","Fizz"]
        let expected2 = ["1","2","Fizz","4","Buzz"]
        let expected3 = ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"]

        XCTAssertTrue(result1 == expected1)
        XCTAssertTrue(result2 == expected2)
        XCTAssertTrue(result3 == expected3)
    }
}
