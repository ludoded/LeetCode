/**
 Given a non-empty string s, you may delete at most one character. Judge whether you can make it a palindrome.

 Example 1:

 Input: "aba"
 Output: True
 Example 2:

 Input: "abca"
 Output: True
 Explanation: You could delete the character 'c'.
 Note:

 The string will only contain lowercase characters a-z. The maximum length of the string is 50000.
 */

class Solution {
    var oneRemoved = false
    
    func validPalindrome(_ s: String) -> Bool {
        let s = Array(s)
        var left = 0
        var right = s.endIndex - 1
        
        while left <= right {
            print(s[left], " - ", s[right])
            if s[left] != s[right] {
                if oneRemoved { return false }
                
                if left < s.count - 1 && s[left + 1] == s[right] {
                    oneRemoved = true
                    if validPalindrome(String(s[(left + 1)...right])) {
                        return true
                    }
                }
                if right > 0 && s[left] == s[right - 1] {
                    oneRemoved = true
                    if validPalindrome(String(s[left...(right-1)])) {
                        return true
                    }
                }
                
                return false
            } else {
                left += 1
                right -= 1
            }
        }
        
        return true
    }
}


print(Solution().validPalindrome("aba")) // true
print(Solution().validPalindrome("abca")) // true
print(Solution().validPalindrome("acba")) // true
print(Solution().validPalindrome("accba")) // true
print(Solution().validPalindrome("acbfa")) // false
print(Solution().validPalindrome("cupuufxoohdfpgjdmysgvhmvffcnqxjjxqncffvmhvgsymdjgpfdhooxfuupucu")) // true


