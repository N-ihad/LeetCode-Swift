//
//  Solution.swift
//  LeetCode
//
//  Created by Nihad on 11/20/21.
//

import Foundation

/*
    https://leetcode.com/problems/design-a-food-rating-system/solutions/4426985/swift-solution-using-heap/
*/

class FoodRatings {

    private var foodsCuisine: [String: String] = [:]
    private var cuisinesFood: [String: Heap<Food>] = [:]

    init(_ foods: [String], _ cuisines: [String], _ ratings: [Int]) {
        for i in 0..<foods.count {
            let food = Food(name: foods[i], rating: ratings[i])
            foodsCuisine[foods[i]] = cuisines[i]
            cuisinesFood[cuisines[i], default: Heap<Food>()].insert(food)
        }
    }

    func changeRating(_ food: String, _ newRating: Int) {
        let cuisine = foodsCuisine[food]!
        cuisinesFood[cuisine]!.replace(Food(name: food, rating: newRating))
    }

    func highestRated(_ cuisine: String) -> String {
        return cuisinesFood[cuisine]!.peek().name
    }
}

/**
 * Your FoodRatings object will be instantiated and called as such:
 * let obj = FoodRatings(foods, cuisines, ratings)
 * obj.changeRating(food, newRating)
 * let ret_2: String = obj.highestRated(cuisine)
 */

struct Food: Comparable, Hashable {
    
    var name: String
    var rating: Int

    static func ==(lhs: Food, rhs: Food) -> Bool {
        return lhs.name == rhs.name
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    static func <(lhs: Food, rhs: Food) -> Bool {
        if lhs.rating < rhs.rating {
            return true
        }
        
        if lhs.rating > rhs.rating {
            return false
        }
        
        if lhs.name > rhs.name {
            return true
        }
        
        if lhs.name < rhs.name {
            return false
        }

        return false
    }
}

struct Heap<T: Comparable & Hashable> {

    private var nodes: [T] = []
    private var indices: [T: Int] = [:]

    func peek() -> T {
        return nodes.first!
    }

    mutating func insert(_ value: T) {
        nodes.append(value)
        indices[value] = nodes.count - 1
        shiftUp(nodes.count - 1)
    }

    mutating func replace(_ value: T) {
        replace(index: index(of: value), value: value)
    }

    private mutating func replace(index i: Int, value: T) {
        guard i < nodes.count else { return }

        indices.removeValue(forKey: nodes[i])
        indices[value] = i

        nodes[i] = value
        shiftUp(i)
        shiftDown(i)
    }

    @inline(__always)
    private func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1) / 2
    }

    @inline(__always)
    private func leftChildIndex(ofIndex i: Int) -> Int {
        return 2 * i + 1
    }

    @inline(__always)
    private func rightChildIndex(ofIndex i: Int) -> Int {
        return 2 * i + 2
    }

    private mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = nodes[childIndex]
        var parentIndex = parentIndex(ofIndex: childIndex)

        while childIndex > 0 && child > nodes[parentIndex] {
            nodes[childIndex] = nodes[parentIndex]
            indices[nodes[childIndex]] = childIndex
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }

        nodes[childIndex] = child
        indices[child] = childIndex
    }

    private mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = leftChildIndex(ofIndex: index)
        let rightChildIndex = leftChildIndex + 1

        var first = index
        if leftChildIndex < endIndex && nodes[leftChildIndex] > nodes[first] {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && nodes[rightChildIndex] > nodes[first] {
            first = rightChildIndex
        }
        if first == index { return }

        nodes.swapAt(index, first)
        indices[nodes[index]] = index
        indices[nodes[first]] = first

        shiftDown(from: first, until: endIndex)
    }

    private mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: nodes.count)
    }

    private func index(of node: T) -> Int {
        return indices[node]!
    }
}
