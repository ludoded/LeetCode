/**
 
 Given a set of candidate numbers (candidates) (without duplicates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.

 The same repeated number may be chosen from candidates unlimited number of times.

 Note:

 All numbers (including target) will be positive integers.
 The solution set must not contain duplicate combinations.
 Example 1:

 Input: candidates = [2,3,6,7], target = 7,
 A solution set is:
 [
   [7],
   [2,2,3]
 ]
 Example 2:

 Input: candidates = [2,3,5], target = 8,
 A solution set is:
 [
   [2,2,2,2],
   [2,3,3],
   [3,5]
 ]
 */

class Solution {
    var res: Set<[Int]> = []
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        findResult2(in: candidates, target, [])
        return Array(res)
    }
    
    func findResult2(in arr: [Int], _ target: Int, _ prefix: [Int]) {
        for num in arr {
            let sub = target - num
            if sub > 0 {
                findResult2(in: arr, sub, prefix + [num])
            }
            if sub == 0 {
                let sorted = (prefix + [num]).sorted()
                res.insert(sorted)
            }
        }
    }
}

print(Solution().combinationSum([2,3,5], 8))
print(Solution().combinationSum([2,3,6,7], 7))

