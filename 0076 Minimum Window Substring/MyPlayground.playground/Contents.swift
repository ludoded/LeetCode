/**
 Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n).

 Example:

 Input: S = "ADOBECODEBANC", T = "ABC"
 Output: "BANC"
 Note:

 If there is no such window in S that covers all characters in T, return the empty string "".
 If there is such window, you are guaranteed that there will always be only one unique minimum window in S.
 */

class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        var needMap = [Character:Int]()
        for char in s {
            needMap[char] = 0
        }
        for char in t {
            if needMap[char] != nil {
                needMap[char] = needMap[char]! + 1
            }
            else {
                 needMap[char] = 1
            }
        }
        
        var start = 0
        var end = 0
        var minLength = Int.max
        var minStart = 0
        var missing = t.count
        let s = Array(s)
        
        while(end < s.count) {
            let current = s[end]
            if(needMap[current]! > 0) {
                missing -= 1
            }
            needMap[current] = needMap[current]! - 1
            
            while(missing == 0) {
                if(minLength > end - start + 1) {
                    minLength =  end - start + 1
                    minStart = start
                }
                
                let head = s[start]
                if(needMap[head]! >= 0) {
                    missing += 1
                }
                needMap[head] = needMap[head]! + 1
                start += 1
            }
            end += 1
        }
        
        return minLength == Int.max ? "" : String(s[minStart..<minStart + minLength])
    }
}


print(Solution().minWindow("ADOBECODEBANC", "ABC"))
print(Solution().minWindow("AAAAAAAAAAAAAAAAAAAAAAAAABCAAAAAAAAAAAAAABAAAAAAC", "ABC"))
print(Solution().minWindow("", "ABC"))
