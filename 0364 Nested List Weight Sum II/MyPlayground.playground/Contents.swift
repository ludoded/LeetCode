/**
 Given a nested list of integers, return the sum of all integers in the list weighted by their depth.

 Each element is either an integer, or a list -- whose elements may also be integers or other lists.

 Different from the previous question where weight is increasing from root to leaf, now the weight is defined from bottom up. i.e., the leaf level integers have weight 1, and the root level integers have the largest weight.

 Example 1:

 Input: [[1,1],2,[1,1]]
 Output: 8
 Explanation: Four 1's at depth 1, one 2 at depth 2.
 Example 2:

 Input: [1,[4,[6]]]
 Output: 17
 Explanation: One 1 at depth 3, one 4 at depth 2, and one 6 at depth 1; 1*3 + 4*2 + 6*1 = 17.
 */

/**
 * // This is the interface that allows for creating nested lists.
 * // You should not implement it, or speculate about its implementation
 * class NestedInteger {
 *     // Return true if this NestedInteger holds a single integer, rather than a nested list.
 *     public func isInteger() -> Bool
 *
 *     // Return the single integer that this NestedInteger holds, if it holds a single integer
 *     // The result is undefined if this NestedInteger holds a nested list
 *     public func getInteger() -> Int
 *
 *     // Set this NestedInteger to hold a single integer.
 *     public func setInteger(value: Int)
 *
 *     // Set this NestedInteger to hold a nested list and adds a nested integer to it.
 *     public func add(elem: NestedInteger)
 *
 *     // Return the nested list that this NestedInteger holds, if it holds a nested list
 *     // The result is undefined if this NestedInteger holds a single integer
 *     public func getList() -> [NestedInteger]
 * }
 */

class NestedInteger {
    func isInteger() -> Bool {
        return true
    }
    
    func getInteger() -> Int { return 0 }
    func getList() -> [NestedInteger] { return [] }
    
}
class Solution {
    var dict: [Int: Int] = [:]
    func depthSumInverse(_ nestedList: [NestedInteger]) -> Int {
        dfs(nestedList, 1)
        
        var sum = 0
        let count = dict.count
        for key in dict.keys {
            let val = dict[key] ?? 0
            let level = count - key + 1
            sum += val * level
        }
        
        return sum
    }
    
    func dfs(_ nestedList: [NestedInteger], _ depth: Int) {
        var sum = 0
        
        for int in nestedList {
            if int.isInteger() {
                sum += int.getInteger()
            } else {
                dfs(int.getList(), depth + 1)
            }
        }
        
        if dict.keys.contains(depth) {
            dict[depth] = dict[depth]! + sum
        } else {
            dict[depth] = sum
        }
        
        return
    }
}
