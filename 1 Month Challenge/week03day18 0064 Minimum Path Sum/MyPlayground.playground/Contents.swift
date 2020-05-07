/**
 Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.

 Note: You can only move either down or right at any point in time.

 Example:

 Input:
 [
   [1,3,1],
   [1,5,1],
   [4,2,1]
 ]
 Output: 7
 Explanation: Because the path 1→3→1→1→1 minimizes the sum.
 */

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        guard !grid.isEmpty
            else { return 0 }
        
        var dp = grid
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if i > 0 && j > 0 {
                    dp[i][j] += min(dp[i-1][j], dp[i][j-1])
                } else if i >= 0 && j >= 0 {
                    if j > 0 {
                        dp[i][j] += dp[i][j-1]
                    } else if i > 0 {
                        dp[i][j] += dp[i-1][j]
                    }
                }
            }
        }
        
        return dp.last?.last ?? 0
    }
}

let arr: [[Int]] = [
    [1,3,1],
    [1,5,1],
    [4,2,1]
]
print(Solution().minPathSum(arr))
