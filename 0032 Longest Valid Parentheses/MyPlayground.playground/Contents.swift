/**
 Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.

 Example 1:

 Input: "(()"
 Output: 2
 Explanation: The longest valid parentheses substring is "()"
 Example 2:

 Input: ")()())"
 Output: 4
 Explanation: The longest valid parentheses substring is "()()"
 */

class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var depth: Int = 0
        var dist: Int = 0
        var dp: [Int] = Array(repeating: -1, count: s.count)
        
        for (i, c) in s.enumerated() {
            if c == ")" {
                depth -= 1
                dp[i] = depth
                depth = max(depth, 0)
            } else if c == "(" {
                depth += 1
                dp[i] = depth
            }
        }
        
        let lastZero = dp.lastIndex(of: 0)
        var head: [Int] = []
        if lastZero != nil {
            head = Array(dp[...lastZero!])
        }
        
        var tail: [Int] = []
        if lastZero == nil {
            tail = dp
        } else if lastZero != nil && lastZero! < dp.endIndex {
            tail = Array(dp[(lastZero! + 1)...])
        }
        
        var length = 0
        for i in 0..<head.count {
            let val = head[i]
            if val >= 0 {
                length += 1
            } else if val < 0 {
                length = 0
            }
            dist = max(dist, length)
        }
        
        if !tail.isEmpty {
            var counter = 0
            var prev = tail.first!
            for i in 1..<tail.count {
                if tail[i] >= 0 && tail[i] < prev {
                    counter += 1
                    dist = max(dist, (counter * 2))
                } else {
                    counter = 0
                }
                prev = tail[i]
            }
        }
        
        return dist
    }
}

print(Solution().longestValidParentheses(")()())")) // 4
print(Solution().longestValidParentheses("))))))))))()(())")) // 6
print(Solution().longestValidParentheses("(((((())((()))")) // 10
print(Solution().longestValidParentheses("))))((()((")) // 2

