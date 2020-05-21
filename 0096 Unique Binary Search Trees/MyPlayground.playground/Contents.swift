/**
 Given n, how many structurally unique BST's (binary search trees) that store values 1 ... n?

 Example:

 Input: 3
 Output: 5
 Explanation:
 Given n = 3, there are a total of 5 unique BST's:

    1         3     3      2      1
     \       /     /      / \      \
      3     2     1      1   3      2
     /     /       \                 \
    2     1         2                 3
 */

class Solution {
    func numTrees(_ n: Int) -> Int {
        var dp: [Int] = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        for i in 1...n {
            for j in 0..<i {
                dp[i] += dp[j] * dp[i - j - 1]
            }
        }
        
        return dp.last!
    }
}

let s = Solution()
//print(s.numTrees(5)) // 42
//print(s.numTrees(6)) // 132
print(s.numTrees(30)) // 132
