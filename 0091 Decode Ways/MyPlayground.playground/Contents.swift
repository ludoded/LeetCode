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
        let s = s.reversed().compactMap({ Int(String($0)) })
        var ll = 0
        var l = 1
        var n = 0
        
        for (i, c) in s.enumerated() {
            if c == 0 {
                let next = i < (s.count - 1) ? s[i+1] : 10
                if i >= (s.count - 1) || (next == 0 || next > 2) {
                    return 0
                } else {
                    n = 0
                }
            } else {
                let next = i > 0 ? s[i-1] : 10
                if (c == 2 && next >= 7) || c > 2 {
                    n = l
                } else {
                    n = ll + l
                }
            }
            
            ll = l
            l = n
        }
        
        return n
    }
    
    func dp(s: String, count: inout Int) {
        if s.isEmpty {
            count += 1
            return
        }
        
        if s[..<s.index(s.startIndex, offsetBy: 1)] != "0" {
            dp(s: String(s[s.index(s.startIndex, offsetBy: 1)...]), count: &count)
        }
        
        if s.count > 1, let n = Int(s[...s.index(s.startIndex, offsetBy: 1)]), n < 27 {
            dp(s: String(s[s.index(s.startIndex, offsetBy: 2)...]), count: &count)
        }
    }
}

print(Solution().numDecodings("27")) // 1
print(Solution().numDecodings("272727")) // 1
print(Solution().numDecodings("262626")) // 8
print(Solution().numDecodings("272707")) // 0
print(Solution().numDecodings("226")) // 3
print(Solution().numDecodings("12")) // 2
print(Solution().numDecodings("1111")) // 5
print(Solution().numDecodings("1111111111")) // 89
print(Solution().numDecodings("10")) // 1 => "01"
print(Solution().numDecodings("101")) // 1
print(Solution().numDecodings("101010")) // 1
print(Solution().numDecodings("0")) // 0
print(Solution().numDecodings("01")) // 0
print(Solution().numDecodings("10001")) // 0
print(Solution().numDecodings("00011")) // 0
print(Solution().numDecodings("101010100100000")) // 0
