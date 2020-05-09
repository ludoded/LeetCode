/**
 A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

 The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

 How many possible unique paths are there?


 Above is a 7 x 3 grid. How many possible unique paths are there?

  

 Example 1:

 Input: m = 3, n = 2
 Output: 3
 Explanation:
 From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
 1. Right -> Right -> Down
 2. Right -> Down -> Right
 3. Down -> Right -> Right
 Example 2:

 Input: m = 7, n = 3
 Output: 28
  

 Constraints:

 1 <= m, n <= 100
 It's guaranteed that the answer will be less than or equal to 2 * 10 ^ 9.
 */

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        guard m > 0, n > 0 else { return 0 }
        
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
        dp[0][0] = 1
        
        for i in 0..<n {
            for j in 0..<m {
                if i == 0, j == 0 { continue }
                var sum = 0
                if i > 0 { sum += dp[i-1][j] }
                if j > 0 { sum += dp[i][j-1] }
                dp[i][j] = sum
            }
        }
        
        return dp.last?.last ?? 0
    }
}

print(Solution().uniquePaths(3, 2)) // 3
print(Solution().uniquePaths(7, 3)) // 28
