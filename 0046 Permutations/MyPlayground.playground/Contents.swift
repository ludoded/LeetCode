/**
 Given a collection of distinct integers, return all possible permutations.

 Example:

 Input: [1,2,3]
 Output:
 [
   [1,2,3],
   [1,3,2],
   [2,1,3],
   [2,3,1],
   [3,1,2],
   [3,2,1]
 ]
 */

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = [[]]
        var dist: [Int] = []
        
        for i in 0..<nums.count {
            let el = nums[i]
            dist.append(el)
            let resCount = result.count
            for _ in 0..<resCount {
                var arr = result.removeLast()
                for j in 0..<dist.count {
                    arr.insert(el, at: j)
                    result.insert(arr, at: 0)
                    arr.remove(at: j)
                }
            }
        }
        
        return result
    }
}

print(Solution().permute([1,2,3]))
print(Solution().permute([1,2,3,4]))

