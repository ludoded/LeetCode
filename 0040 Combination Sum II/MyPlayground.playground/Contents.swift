/**
 40. Combination Sum II
 Medium

 1516

 57

 Add to List

 Share
 Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.

 Each number in candidates may only be used once in the combination.

 Note:

 All numbers (including target) will be positive integers.
 The solution set must not contain duplicate combinations.
 Example 1:

 Input: candidates = [10,1,2,7,6,1,5], target = 8,
 A solution set is:
 [
   [1, 7],
   [1, 2, 5],
   [2, 6],
   [1, 1, 6]
 ]
 Example 2:

 Input: candidates = [2,5,2,1,2], target = 5,
 A solution set is:
 [
   [1,2,2],
   [5]
 ]
 */

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var candidate = [Int]()
        
        backtracking(&result, &candidate, candidates.sorted(), target, 0)
        
        return result
    }
    
    private func backtracking(_ result: inout [[Int]], _ candidate: inout [Int], _ candidates: [Int], _ remain: Int, _ start: Int) {
        if remain < 0 {
            return
        } else if remain == 0 {
            result.append(candidate)
        } else {
            for i in start..<candidates.count {
                if i > start && candidates[i] == candidates[i - 1] {
                    continue
                }
                candidate.append(candidates[i])
                backtracking(&result, &candidate, candidates, remain - candidates[i], i + 1)
                candidate.removeLast()
            }
        }
    }
}

print(Solution().combinationSum2([10,1,2,7,6,1,5], 8))
