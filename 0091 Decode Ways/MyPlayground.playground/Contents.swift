/**
 A message containing letters from A-Z is being encoded to numbers using the following mapping:

 'A' -> 1
 'B' -> 2
 ...
 'Z' -> 26
 Given a non-empty string containing only digits, determine the total number of ways to decode it.

 Example 1:

 Input: "12"
 Output: 2
 Explanation: It could be decoded as "AB" (1 2) or "L" (12).
 Example 2:

 Input: "226"
 Output: 3
 Explanation: It could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).
 */

class Solution {
    func numDecodings(_ s: String) -> Int {
        var dp: [Int] = [1]
        var prevSymb: String.Element? = nil
        
        for c in s {
            let val: Int = prevSymb == nil ? 0 : (prevSymb == "1") ? 1 : (prevSymb == "2" && c <= "6") ? 1 : 0
            if c == "1" || c == "2" {
                prevSymb = c
            } else {
                prevSymb = nil
            }
            let prev = dp.last ?? 0
            dp.append(prev + val)
            print(dp)
            print(c)
            print()
        }
        
        return dp.last ?? 0
    }
}

print(Solution().numDecodings("226")) // 3
print(Solution().numDecodings("12")) // 2
print(Solution().numDecodings("1111")) // 5
