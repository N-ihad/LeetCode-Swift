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

    func testSolution_wordBreak_1() {
        // given
        let s = "catsanddog"
        let wordDict = ["cat","cats","and","sand","dog"]

        // when
        let result = sut.wordBreak(s, wordDict)

        // then
        let expected = ["cats and dog", "cat sand dog"]

        XCTAssertEqual(Set<String>(result), Set<String>(expected))
    }

    func testSolution_wordBreak_2() {
        // given
        let s = "pineapplepenapple"
        let wordDict = ["apple","pen","applepen","pine","pineapple"]

        // when
        let result = sut.wordBreak(s, wordDict)

        // then
        let expected = ["pine apple pen apple","pineapple pen apple","pine applepen apple"]

        XCTAssertEqual(Set<String>(result), Set<String>(expected))
    }

    func testSolution_wordBreak_3() {
        // given
        let s = "catsandog"
        let wordDict = ["cats","dog","sand","and","cat"]

        // when
        let result = sut.wordBreak(s, wordDict)

        // then
        let expected: [String] = []

        XCTAssertEqual(Set<String>(result), Set<String>(expected))
    }
}
