/**
 Given an input string, reverse the string word by word.

  

 Example 1:

 Input: "the sky is blue"
 Output: "blue is sky the"
 Example 2:

 Input: "  hello world!  "
 Output: "world! hello"
 Explanation: Your reversed string should not contain leading or trailing spaces.
 Example 3:

 Input: "a good   example"
 Output: "example good a"
 Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.
  

 Note:

 A word is defined as a sequence of non-space characters.
 Input string may contain leading or trailing spaces. However, your reversed string should not contain leading or trailing spaces.
 You need to reduce multiple spaces between two words to a single space in the reversed string.
  

 Follow up:

 For C programmers, try to solve it in-place in O(1) extra space.
 */
class Solution {
    func reverseWords(_ s: String) -> String {
        var s = s
        var chars = Array(s)
        var i = 0
        var j = 0
        
        chars.reverse()
        while i < chars.count {
            j = i
            while j < chars.count && chars[j] != " " {
                j += 1
            }
            chars[i..<j].reverse()
            i = j + 1
        }
        
        s = String(chars)
        
        return s
    }
}

let s = Solution()

print(s.reverseWords("  hello world!  ")) // "world! hello"
print(s.reverseWords("the sky is blue")) // "world! hello"
print(s.reverseWords("a good   example")) // "world! hello"

