/**
 Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

 Example:

 Input: [0,1,0,3,12]
 Output: [1,3,12,0,0]
 Note:

 You must do this in-place without making a copy of the array.
 Minimize the total number of operations.
 */

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var next: Int = 0
        let count: Int = nums.count
        
        for _ in 0..<count {
            if nums[next] == 0 {
                let removedZero = nums.remove(at: next)
                nums.append(removedZero)
            } else {
                next += 1
            }
        }
    }
}


var a = [0,1,0,3,12]
Solution().moveZeroes(&a)
print(a)

var b = [0,0,0,0,12]
Solution().moveZeroes(&b)
print(b)

var c = [0,0,0,0,0]
Solution().moveZeroes(&c)
print(c)

var d: [Int] = []
Solution().moveZeroes(&d)
print(d)
