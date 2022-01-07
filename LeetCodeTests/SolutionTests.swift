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

    func testSolution_groupAnagrams() {
        // given
        let strs1 = ["eat","tea","tan","ate","nat","bat"]
        let strs2 = [""]
        let strs3 = ["a"]

        // when
        let result1 = sut.groupAnagrams(strs1)
        let result2 = sut.groupAnagrams(strs2)
        let result3 = sut.groupAnagrams(strs3)

        // then
        let expected1 = [["eat","tea","ate"],["tan","nat"],["bat"]]
        let expected2 = [[""]]
        let expected3 = [["a"]]

        XCTAssertEqual(result1, expected1)
        XCTAssertEqual(result2, expected2)
        XCTAssertEqual(result3, expected3)
    }
}
