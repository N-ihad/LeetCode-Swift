//
//  main.swift
//  LeetCode
//
//  Created by Nihad on 11/17/21.
//

import Foundation

// given
let sut = Solution()

let head1 = [1, 2, 3, 4, 5]
let head2 = [2, 1, 3, 5, 6, 4, 7]

// when
let result1 = sut.oddEvenList(Helper.makeList(fromArray: head1))
let result2 = sut.oddEvenList(Helper.makeList(fromArray: head2))

// then
Helper.printList(result1)
Helper.printList(Helper.makeList(fromArray: head1))
Helper.printList(result2)
Helper.printList(Helper.makeList(fromArray: head2))
