import UIKit

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        guard !nums.isEmpty else { return false }
        guard nums.count > 1 else { return true }
        
        var counter = 0
        let endIndex = nums.endIndex - 1
        for i in 1...nums.count {
            let nextIndex = endIndex - i
            if nextIndex >= 0 {
                if nums[nextIndex] > counter {
                    counter = 0
                } else {
                    counter += 1
                }
            } else {
                break
            }
        }
        
        return counter == 0
    }
}


print(Solution.init().canJump([4,0,0,0,1])) // true
print(Solution.init().canJump([1,2,3,0,5])) // true
print(Solution.init().canJump([])) // false
print(Solution.init().canJump([0]))  // true
print(Solution.init().canJump([4,1])) // true
print(Solution.init().canJump([3,2,1,0,3])) // false
print(Solution.init().canJump([2,0,0])) // true


