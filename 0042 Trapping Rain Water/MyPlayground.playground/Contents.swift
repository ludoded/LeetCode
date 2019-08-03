/**
 Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.
 
 
 The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped. Thanks Marcos for contributing this image!
 
 Input: [0,1,0,2,1,0,1,3,2,1,2,1]
 Output: 6

 */

/**
 int trap(vector<int>& height)
 {
 int left = 0, right = height.size() - 1;
 int ans = 0;
 int left_max = 0, right_max = 0;
 while (left < right) {
 if (height[left] < height[right]) {
 height[left] >= left_max ? (left_max = height[left]) : ans += (left_max - height[left]);
 ++left;
 }
 else {
 height[right] >= right_max ? (right_max = height[right]) : ans += (right_max - height[right]);
 --right;
 }
 }
 return ans;
 }
 */

import UIKit

class Solution {
    func trap(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var ans = 0
        var leftMax = 0
        var rightMax = 0
        
        while (left < right) {
            if height[left] < height[right] {
                if height[left] >= leftMax {
                    leftMax = height[left]
                } else {
                    ans += leftMax - height[left]
                }
                left += 1
            } else {
                if height[right] >= rightMax {
                    rightMax = height[right]
                } else {
                    ans += rightMax - height[right]
                }
                right -= 1
            }
        }
        return ans
    }
}


print(Solution().trap([0,1,0,2,1,0,1,3,2,1,2,1])) // 6
print(Solution().trap([])) // 0
print(Solution().trap([0])) // 0
print(Solution().trap([0,0,1,2,3,4,5,6,5,4,3,2,1,0])) // 0
print(Solution().trap([0,1,0,2,1,0,1,2,3,2,0,2,1])) // 7
print(Solution().trap([5,4,1,2])) // 1
print(Solution().trap([9,6,8,8,5,6,3])) // 3
