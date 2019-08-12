/**
 Given an array of non-negative integers, you are initially positioned at the first index of the array.
 
 Each element in the array represents your maximum jump length at that position.
 
 Your goal is to reach the last index in the minimum number of jumps.
 
 Example:
 
 Input: [2,3,1,1,4]
 Output: 2
 Explanation: The minimum number of jumps to reach the last index is 2.
 Jump 1 step from index 0 to 1, then 3 steps to the last index.
 Note:
 
 You can assume that you can always reach the last index.
 */

import UIKit

class Solution {
    func jump(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        guard nums.count > 1 else { return 0 }
        
        var jumpCount = 0
        var index = 0
        
        while true {
            let value = nums[index]
            
            let endIndex = index + value
            if endIndex >= (nums.endIndex - 1) {
                jumpCount += 1
                break
            }
            
            var max = 0
            var nextIndex = 0
            for i in index...endIndex {
                if max <= nums[i] + i {
                    max = nums[i] + i
                    nextIndex = i
                }
            }
            
            if nextIndex == index {
                index += max
            } else {
                index = nextIndex
            }
            
            jumpCount += 1
        }
        
        return jumpCount
    }
}

print(Solution.init().jump([2,3,1,1,4])) // 2
print(Solution.init().jump([2,3,1,1,4,5,0,0,1,2,9])) // 4
print(Solution.init().jump([2,0,0])) // 1
print(Solution.init().jump([1,1,1,1,1,1,1])) // 6
print(Solution.init().jump([3,3,3,3,3,3,3,3,3,3])) // 3
print(Solution.init().jump([10,9,8,7,6,5,4,3,2,1,1,0])) // 2
print(Solution.init().jump([4,1,1,3,1,1,1])) // 2

