/**
 Given two strings S and T, return if they are equal when both are typed into empty text editors. # means a backspace character.

 Example 1:

 Input: S = "ab#c", T = "ad#c"
 Output: true
 Explanation: Both S and T become "ac".
 Example 2:

 Input: S = "ab##", T = "c#d#"
 Output: true
 Explanation: Both S and T become "".
 Example 3:

 Input: S = "a##c", T = "#a#c"
 Output: true
 Explanation: Both S and T become "c".
 Example 4:

 Input: S = "a#c", T = "b"
 Output: false
 Explanation: S becomes "c" while T becomes "b".
 Note:

 1 <= S.length <= 200
 1 <= T.length <= 200
 S and T only contain lowercase letters and '#' characters.
 Follow up:

 Can you solve it in O(N) time and O(1) space?
 */
/**
 aaa###
      |
 c#
  |
 */
class Solution {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        var cursorS = S.count - 1
        var depthS: Int = 0
        var cursorT = T.count - 1
        var depthT: Int = 0
        while cursorS >= 0 || cursorT >= 0 {
            let indexS = String.Index(encodedOffset: cursorS)
            let indexT = String.Index(encodedOffset: cursorT)
            
            if cursorS >= 0 {
                if S[indexS] == "#" {
                    depthS += 1
                    cursorS -= 1
                    continue
                } else if depthS > 0 {
                    depthS -= 1
                    cursorS -= 1
                    continue
                }
            }
            
            if cursorT >= 0 {
                if T[indexT] == "#" {
                    depthT += 1
                    cursorT -= 1
                    continue
                } else if depthT > 0 {
                    depthT -= 1
                    cursorT -= 1
                    continue
                }
            }
            
            if cursorS >= 0 && cursorT >= 0 && S[indexS] != T[indexT] {
                return false
            }
            if (cursorS >= 0) != (cursorT >= 0) {
                return false
            }
            
            // at the end
            if cursorS >= 0 { cursorS -= 1 }
            if cursorT >= 0 { cursorT -= 1 }
        }
        
        return true
    }
}

print(Solution().backspaceCompare("ab#c", "ad#c")) // true
print(Solution().backspaceCompare("ab##", "c#d#")) // true
print(Solution().backspaceCompare("a##c", "#a#c")) // true
print(Solution().backspaceCompare("a#c", "b")) // false
print(Solution().backspaceCompare("ab#c", "ad##c")) // false
print(Solution().backspaceCompare("aaa###", "c#")) // true

