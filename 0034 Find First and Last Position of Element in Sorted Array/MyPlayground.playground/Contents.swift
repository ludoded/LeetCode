import UIKit

class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = nums.count - 1
        var mid = (left + right) / 2
        var foundIndex = -1
        
        while left <= right {
            if nums[mid] == target {
                foundIndex = mid
                break
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
            
            mid = (left + right) / 2
        }
        
        if foundIndex == -1 {
            return [-1, -1]
        }
        
        // BS for left
        var lRight = foundIndex
        mid = (left + lRight) / 2
        while left <= lRight {
            if nums[mid] == target {
                lRight = mid - 1
            } else {
                left = mid + 1
            }
            mid = (left + lRight) / 2
        }
        
        // BS for right
        var rLeft = foundIndex
        mid = (rLeft + right) / 2
        while rLeft <= right {
            
            if nums[mid] == target {
                rLeft = mid + 1
            } else {
                right = mid - 1
            }
            mid = (rLeft + right) / 2
        }
        
        return [left, right]
    }
}

print(Solution.init().searchRange([5,7,7,8,8,10], 8)) // [3, 4]
print(Solution.init().searchRange([5,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,10], 7)) // [1, 15]
print(Solution.init().searchRange([5,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,10], 8)) // [16, 17]
print(Solution.init().searchRange([5,7,7,8,8,10], 6)) // [-1, -1]
print(Solution.init().searchRange([], 8)) // [-1, -1]
print(Solution.init().searchRange([1], 1)) // [0, 0]

