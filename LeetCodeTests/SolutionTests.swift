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

    func testSolution_letterCombinations() {
        // given
        let digits1 = "23"
        let digits2 = ""
        let digits3 = "2"
        let digits4 = "234"

        // when
        let result1 = sut.letterCombinations(digits1)
        let result2 = sut.letterCombinations(digits2)
        let result3 = sut.letterCombinations(digits3)
        let result4 = sut.letterCombinations(digits4)

        // then
        let expected1 = ["ad","ae","af","bd","be","bf","cd","ce","cf"]
        let expected2 = [String]()
        let expected3 = ["a","b","c"]
        let expected4 = ["adg","adh","adi","aeg","aeh","aei","afg","afh","afi","bdg","bdh","bdi","beg","beh","bei","bfg","bfh","bfi","cdg","cdh","cdi","ceg","ceh","cei","cfg","cfh","cfi"]

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
        XCTAssertEqual(result4, expected4)
    }
}
