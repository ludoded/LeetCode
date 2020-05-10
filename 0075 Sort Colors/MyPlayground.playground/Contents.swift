/**
 Given an array with n objects colored red, white or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white and blue.

 Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.

 Note: You are not suppose to use the library's sort function for this problem.

 Example:

 Input: [2,0,2,1,1,0]
 Output: [0,0,1,1,2,2]
 Follow up:

 A rather straight forward solution is a two-pass algorithm using counting sort.
 First, iterate the array counting number of 0's, 1's, and 2's, then overwrite array with total number of 0's, then 1's and followed by 2's.
 Could you come up with a one-pass algorithm using only constant space?
 */

class Solution {
    func sortColors(_ nums: inout [Int]) {
        var startPointer = 0
        var endPointer = nums.count - 1
        
        while startPointer <= endPointer {
            if nums[startPointer] == 0 {
                let z = nums.remove(at: startPointer)
                nums.insert(z, at: 0)
            } else if nums[startPointer] == 2 {
                let t = nums.remove(at: startPointer)
                nums.append(t)
                endPointer -= 1
                continue
            }
            startPointer += 1
        }
    }
}

var arr = [2,0,2,1,1,0]
Solution().sortColors(&arr)
print(arr)

var arr2 = [2,2,1,1,0,0]
Solution().sortColors(&arr2)
print(arr2)

var arr3 = [0,0,0,0,0]
Solution().sortColors(&arr3)
print(arr3)

var arr4 = [2,2,2,2,2,2]
Solution().sortColors(&arr4)
print(arr4)
