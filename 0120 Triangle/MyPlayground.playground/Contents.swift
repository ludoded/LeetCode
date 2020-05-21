/**
 Given a triangle, find the minimum path sum from top to bottom. Each step you may move to adjacent numbers on the row below.

 For example, given the following triangle

 [
      [2],
     [3,4],
    [6,5,7],
   [4,1,8,3]
 ]
 The minimum path sum from top to bottom is 11 (i.e., 2 + 3 + 5 + 1 = 11).

 Note:

 Bonus point if you are able to do this using only O(n) extra space, where n is the total number of rows in the triangle.
 */

class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 1 else { return triangle.first?.first ?? 0 }
        var dp: [Int] = triangle.first!
        
        for i in 1..<triangle.count {
            var newDp: [Int] = []
            for j in 0..<triangle[i].count {
                let prevCount = dp.count
                let l = (j - 1) < 0 ? Int.max : dp[j-1]
                let r = j >= prevCount ? Int.max : dp[j]
                let n = triangle[i][j] + min(l, r)
                newDp.append(n)
            }
            dp = newDp
        }
        
        return dp.min() ?? 0
    }
}

let s = Solution()
let arr: [[Int]] = [[-1],[2,3],[1,-1,-3]]
print(s.minimumTotal(arr)) // -1
