//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/image-smoother/solutions/4426285/swift-solution-with-explanation/

    Iterate through the matrix summing all neighboring cells of img[i][j], 
    also taking into account only elements which indices are within bounds of
    img: ix >= 0 && ix < img.count && jy >= 0 && jy < img[0].count. 
    After traversing all neighboring elements, we just calculate the average, 
    which is sum of all neighboring cells (that are of course withing the bounds) 
    divided by the number of neighboring cells (that are withing the bounds) and
    put the result into corresponding cell result[i][j].
    At the end we just return the resulting matrix result.
*/

class Solution {
    func imageSmoother(_ img: [[Int]]) -> [[Int]] {
        var result = img

        for i in 0..<img.count {
            for j in 0..<img[0].count {
                var (sum, count) = (0, 0)

                for x in -1...1 {
                    for y in -1...1 {
                        let (ix, jy) = (i+x, j+y)
                        if ix >= 0 && ix < img.count && jy >= 0 && jy < img[0].count {
                            sum += img[ix][jy]
                            count += 1
                        }
                    }
                }

                result[i][j] = sum / count
            }
        }

        return result
    }
}

