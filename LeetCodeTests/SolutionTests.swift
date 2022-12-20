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

    func testSolution_pushDominoes_1() {
        // given
        let dominoes = "RR.L"

        // when
        let result = sut.pushDominoes(dominoes)

        // then
        let expected = "RR.L"

        XCTAssertEqual(result, expected)
    }

    func testSolution_pushDominoes_2() {
        // given
        let dominoes = ".L.R...LR..L.."

        // when
        let result = sut.pushDominoes(dominoes)

        // then
        let expected = "LL.RR.LLRRLL.."

        XCTAssertEqual(result, expected)
    }
}
