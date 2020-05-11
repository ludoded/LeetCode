/**
 Given a string s of '(' , ')' and lowercase English characters.

 Your task is to remove the minimum number of parentheses ( '(' or ')', in any positions ) so that the resulting parentheses string is valid and return any valid string.

 Formally, a parentheses string is valid if and only if:

 It is the empty string, contains only lowercase characters, or
 It can be written as AB (A concatenated with B), where A and B are valid strings, or
 It can be written as (A), where A is a valid string.
  

 Example 1:

 Input: s = "lee(t(c)o)de)"
 Output: "lee(t(c)o)de"
 Explanation: "lee(t(co)de)" , "lee(t(c)ode)" would also be accepted.
 Example 2:

 Input: s = "a)b(c)d"
 Output: "ab(c)d"
 Example 3:

 Input: s = "))(("
 Output: ""
 Explanation: An empty string is also valid.
 Example 4:

 Input: s = "(a(b(c)d)"
 Output: "a(b(c)d)"
  

 Constraints:

 1 <= s.length <= 10^5
 s[i] is one of  '(' , ')' and lowercase English letters.
 */

class Solution {
    func minRemoveToMakeValid(_ s: String) -> String {
        var pars: [(Character, Int)] = []
        var s = Array(s)
        
        for (i, c) in s.enumerated() {
            if c == "(" {
                pars.append((c, i))
            } else if c == ")" {
                if let last = pars.last, last.0 == "(" {
                    pars.removeLast()
                } else {
                    pars.append((c, i))
                }
            }
        }
        
        for p in pars.reversed() {
            s.remove(at: p.1)
        }
        
        return String(s)
    }
}

let s = Solution()

print(s.minRemoveToMakeValid("lee(t(c)o)de)")) // lee(t(c)o)de
print(s.minRemoveToMakeValid("a)b(c)d")) // ab(c)d
print(s.minRemoveToMakeValid("))((")) // ""
print(s.minRemoveToMakeValid("(a(b(c)d)")) // a(b(c)d)
