/**
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

 (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).

 You are given a target value to search. If found in the array return its index, otherwise return -1.

 You may assume no duplicate exists in the array.

 Your algorithm's runtime complexity must be in the order of O(log n).

 Example 1:

 Input: nums = [4,5,6,7,0,1,2], target = 0
 Output: 4
 Example 2:

 Input: nums = [4,5,6,7,0,1,2], target = 3
 Output: -1
 */

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        if nums.count == 0 {
            return -1
        }
        
        var left = 0
        var right = nums.count - 1
        var middle = 0
        
        while left < right {
            middle = (left + right) / 2
            if nums[middle] == target {
                return middle
            }
            if nums[left] <= nums[middle] {
                if target >= nums[left] && target < nums[middle] {
                    right = middle - 1
                } else {
                    left = middle + 1
                }
            } else {
                if target > nums[middle] && target <= nums[right] {
                    left = middle + 1
                } else {
                    right = middle - 1
                }
            }
        }
        
        return nums[left] == target ? left : -1
    }
}

print(Solution().search([4,5,6,7,0,1,2], 0)) // 4
print(Solution().search([4,5,6,7,0,1,2], 3)) // -1
print(Solution().search([4,5,6,7,0,1,2,3], 3)) // 7
print(Solution().search([4,5,6,7,0,1,2,3], 5)) // 1

