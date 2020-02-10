/**
 Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

 Note:

 The solution set must not contain duplicate triplets.

 Example:

 Given array nums = [-1, 0, 1, 2, -1, -4],

 A solution set is:
 [
   [-1, 0, 1],
   [-1, -1, 2]
 ]
 */

import UIKit

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else { return [[]] }
        
        var i = 0
        var j = 1
        var k = nums.endIndex - 1
        
        
    }
    
    func isSumEqualsToZero(_ a: Int, _ b: Int, _ c: Int) -> Bool {
        return (a + b + c) == 0
    }
}
