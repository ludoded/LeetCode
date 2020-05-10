/**
 Given a set of distinct integers, nums, return all possible subsets (the power set).

 Note: The solution set must not contain duplicate subsets.

 Example:

 Input: nums = [1,2,3]
 Output:
 [
   [3],
   [1],
   [2],
   [1,2,3],
   [1,3],
   [2,3],
   [1,2],
   []
 ]
 */

class Solution {
    var results: [[Int]] = [[]]
    var candidate: [Int] = []
    var nums: [Int]!
    
    func subsets(_ nums: [Int]) -> [[Int]] {
        self.nums = nums
        
        backtrace(0)
        return results
    }
    
    private func backtrace(_ idx: Int) {
        if idx >= nums.count {
            return
        }
        
        for i in idx..<nums.count {
            candidate.append(nums[i])
            results.append(candidate)
            backtrace(i + 1)
            candidate.removeLast()
        }
    }
}

let s = Solution()
print(s.subsets([1,2,3,4,6]))
print(s.subsets([1,4,7]))
