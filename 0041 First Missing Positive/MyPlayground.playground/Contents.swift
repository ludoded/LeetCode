
/**
 Given an unsorted integer array, find the smallest missing positive integer.
 
 Example 1:
 
 Input: [1,2,0]
 Output: 3
 Example 2:
 
 Input: [3,4,-1,1]
 Output: 2
 Example 3:
 
 Input: [7,8,9,11,12]
 Output: 1
 Note:
 
 Your algorithm should run in O(n) time and uses constant extra space.
 */

import UIKit

class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var set: Set<Int> = []
        
        for num in nums where num > 0 {
            set.insert(num)
        }
        
        guard !set.isEmpty else { return 1 }
        
        for i in 1...set.count where !set.contains(i) {
            return i
        }
        
        return set.count + 1
    }
}

print(Solution().firstMissingPositive([4,3,-1,1])) // 2
print(Solution().firstMissingPositive([0,0,0,0])) // 1
print(Solution().firstMissingPositive([])) // 1
print(Solution().firstMissingPositive([1])) // 2

let arr: [Int] = Array(1...10000)
print(Solution().firstMissingPositive(arr)) // 10001
