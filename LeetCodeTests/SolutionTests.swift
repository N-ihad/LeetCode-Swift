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
        let s = "leetcode"
        let wordDict = ["leet","code"]

        // when
        let result = sut.wordBreak(s, wordDict)

        // then
        let expected = true

        XCTAssertEqual(result, expected)
    }

    func testSolution_wordBreak_2() {
        // given
        let s = "applepenapple"
        let wordDict = ["apple","pen"]

        // when
        let result = sut.wordBreak(s, wordDict)

        // then
        let expected = true

        XCTAssertEqual(result, expected)
    }

    func testSolution_wordBreak_3() {
        // given
        let s = "catsandog"
        let wordDict = ["cats","dog","sand","and","cat"]

        // when
        let result = sut.wordBreak(s, wordDict)

        // then
        let expected = false

        XCTAssertEqual(result, expected)
    }

    func testSolution_wordBreak_4() {
        // given
        let s = "aaaaaaa"
        let wordDict = ["aaaa","aaa"]

        // when
        let result = sut.wordBreak(s, wordDict)

        // then
        let expected = true

        XCTAssertEqual(result, expected)
    }

    func testSolution_wordBreak_5() {
        // given
        let s = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab"
        let wordDict = ["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"]

        // when
        let result = sut.wordBreak(s, wordDict)

        // then
        let expected = false

        XCTAssertEqual(result, expected)
    }
}
