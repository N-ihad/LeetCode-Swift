//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/product-of-the-last-k-numbers/solutions/6423120/swift-solution-prefix-products-array-by-jugms/

    The `ProductOfNumbers` class efficiently maintains the product of the last `k` numbers using a prefix product approach. 
    It stores a list `products`, where `products[i]` represents the cumulative product of all numbers added so far. 
    The list is initialized with `1` to simplify calculations. When a new number is added, 
    it is multiplied with the last element of `products` and appended. If `0` is added, 
    the list resets to `[1]` to handle the effect of zero on multiplication. 
    The `getProduct(k)` method retrieves the product of the last `k` numbers by 
    dividing the last stored product by the product at position `products.count - 1 - k`. 
    If `k` is larger than the available products (meaning a `0` was encountered and reset the list), it returns `0`.
*/

class ProductOfNumbers {

    private var products: [Int] = [1]

    func add(_ num: Int) {
        if num == 0 {
            products = [1]
            return
        }

        products.append(products[products.count-1] * num)
    }

    func getProduct(_ k: Int) -> Int {
        if k > products.count - 1 { // because our 1 in array shouldn't be counted
            return 0
        }

        return products[products.count-1] / products[products.count-1-k]
    }
}

/**
 * Your ProductOfNumbers object will be instantiated and called as such:
 * let obj = ProductOfNumbers()
 * obj.add(num)
 * let ret_2: Int = obj.getProduct(k)
 */
