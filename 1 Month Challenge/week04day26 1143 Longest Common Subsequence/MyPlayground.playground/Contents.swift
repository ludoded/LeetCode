/**
 Given two strings text1 and text2, return the length of their longest common subsequence.

 A subsequence of a string is a new string generated from the original string with some characters(can be none) deleted without changing the relative order of the remaining characters. (eg, "ace" is a subsequence of "abcde" while "aec" is not). A common subsequence of two strings is a subsequence that is common to both strings.

  

 If there is no common subsequence, return 0.

  

 Example 1:

 Input: text1 = "abcde", text2 = "ace"
 Output: 3
 Explanation: The longest common subsequence is "ace" and its length is 3.
 Example 2:

 Input: text1 = "abc", text2 = "abc"
 Output: 3
 Explanation: The longest common subsequence is "abc" and its length is 3.
 Example 3:

 Input: text1 = "abc", text2 = "def"
 Output: 0
 Explanation: There is no such common subsequence, so the result is 0.
  

 Constraints:

 1 <= text1.length <= 1000
 1 <= text2.length <= 1000
 The input strings consist of lowercase English characters only.
 
    Hide Hint #1
 Try dynamic programming. DP[i][j] represents the longest common subsequence of text1[0 ... i] & text2[0 ... j].
    Hide Hint #2
 DP[i][j] = DP[i - 1][j - 1] + 1 , if text1[i] == text2[j] DP[i][j] = max(DP[i - 1][j], DP[i][j - 1]) , otherwise
 */

class Solution {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        guard !text1.isEmpty, !text2.isEmpty
            else { return 0 }
        let t1 = Array(text1)
        let t2 = Array(text2)
        
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: t2.count), count: t1.count)
        
        var i: Int = 0
        
        while i < t1.count {
            var j: Int = 0
            while j < t2.count {
                let c1 = t1[i]
                let c2 = t2[j]
                
                if c1 == c2 {
                    let val = ((i - 1) >= 0 && (j - 1) >= 0) ? dp[i-1][j-1] : 0
                    dp[i][j] = val + 1
                } else {

                    let north = (i - 1) >= 0 ? dp[i-1][j] : 0
                    let west = (j - 1) >= 0 ? dp[i][j-1] : 0
                    let val = max(north, west)
                    dp[i][j] = val
                }
                
                j += 1
            }
            i += 1
        }
        print(dp)
        return dp.last?.last ?? 0
    }
    
    private func fillDP(_ dp: inout [[Int]], _ i: Int, _ j: Int, _ val: Int) {
        var val = val
        for m in 0..<dp[i].count - j {
            let north = (i - 1) >= 0 ? dp[i-1][j + m] : 0
            val = max(north, val)
            dp[i][j + m] = val
        }
        
//        for n in 0..<dp.count - i {
//            dp[i + n][j] = val
//        }
    }
}

print(Solution().longestCommonSubsequence("cab", "abc")) // 2
print(Solution().longestCommonSubsequence("abcde", "ace")) // 3
print(Solution().longestCommonSubsequence("abc", "def")) // 0
print(Solution().longestCommonSubsequence("bsbininm", "jmjkbkjkv")) // 1
