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

    func testSolution_WordDictionary_1() {
        // given
        let wordDictionary = Solution.WordDictionary()

        // when
        wordDictionary.addWord("bad")
        wordDictionary.addWord("dad")
        wordDictionary.addWord("ddc")
        wordDictionary.addWord("dd")
        wordDictionary.addWord("mad")

        // then
        XCTAssertEqual(wordDictionary.search("pad"), false)
        XCTAssertEqual(wordDictionary.search("bad"), true)
        XCTAssertEqual(wordDictionary.search(".ad"), true)
        XCTAssertEqual(wordDictionary.search("b.."), true)
    }

    func testSolution_WordDictionary_2() {
        // given
        let wordDictionary = Solution.WordDictionary()

        // when
        wordDictionary.addWord("a")
        wordDictionary.addWord("ab")

        // then
        XCTAssertEqual(wordDictionary.search("a"), true)
        XCTAssertEqual(wordDictionary.search("a."), true)
        XCTAssertEqual(wordDictionary.search("ab"), true)
        XCTAssertEqual(wordDictionary.search(".a"), false)
        XCTAssertEqual(wordDictionary.search(".b"), true)
        XCTAssertEqual(wordDictionary.search("ab."), false)
        XCTAssertEqual(wordDictionary.search(".."), true)
        XCTAssertEqual(wordDictionary.search("."), true)
    }

//    func testSolution_WordDictionary_3() {
//        // given
//        let wordDictionary = Solution.WordDictionary()
//
//        // when
////        wordDictionary.addWord("lfohkladaibkdemlnonbnhba")
//
//        // then
//        var answer: Bool!
//        for _ in 0..<10000000 {
//            answer = wordDictionary.search("lfohkladaibkdemlnonbnhba")
//        }
//
//        XCTAssertEqual(answer, true)
//    }
}
