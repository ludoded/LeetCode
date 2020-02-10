import UIKit

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        
    }
    
    func findTarget(_ nums: [Int], _ target: Int) -> [Array<Int>.Index] {
        guard !nums.isEmpty else { return [-1, -1] }
        let count = nums.count
        guard count > 1 else { return [0, 0] }
        
        var leftIndex = 0
        var rightIndex = count - 1
        
        while leftIndex < rightIndex {
            let mid = (rightIndex - leftIndex + 1) / 1
            let midNum = nums[mid]
            if midNum == target {
                
                
            } else if midNum > target {
                //left
                rightIndex = mid
            } else {
                //right
                leftIndex = mid
            }
        }
    }
}

print(Solution.init().searchRange([5,7,7,8,8,10], 8)) // [3, 4]
print(Solution.init().searchRange([5,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,10], 7)) // [1, 15]
print(Solution.init().searchRange([5,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,10], 8)) // [16, 17]
print(Solution.init().searchRange([5,7,7,8,8,10], 6)) // [-1, -1]
print(Solution.init().searchRange([], 8)) // [-1, -1]

