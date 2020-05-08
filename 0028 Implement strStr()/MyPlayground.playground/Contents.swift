/**
 Implement strStr().

 Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

 Example 1:

 Input: haystack = "hello", needle = "ll"
 Output: 2
 Example 2:

 Input: haystack = "aaaaa", needle = "bba"
 Output: -1
 Clarification:

 What should we return when needle is an empty string? This is a great question to ask during an interview.

 For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().
 */

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard !needle.isEmpty else { return 0 }
        let haystack = Array(haystack)
        let needle = Array(needle)
        var haystackIndex = 0
        var needleIndex = 0
        let endIndex = haystack.count
        
        while haystackIndex < endIndex {
            if haystack[haystackIndex] == needle[needleIndex] {
                if needleIndex == needle.count - 1 {
                    return haystackIndex - needleIndex
                }
                needleIndex += 1
            } else {
                if needleIndex > 0 {
                    haystackIndex -= needleIndex
                }
                needleIndex = 0
            }
            print(haystackIndex)
            print(needleIndex)
            print("======")
            haystackIndex += 1
        }
        
        return -1
    }
}

print(Solution().strStr("hello", "ll")) // 2
print(Solution().strStr("hello", "els")) // -1
print(Solution().strStr("hello", "sss")) // -1
print(Solution().strStr("hello", "")) // 0
print(Solution().strStr("hello", "lloo")) // -1
print(Solution().strStr("mississippi", "issip")) // 4
print(Solution().strStr("mississippi", "issi")) // 1
print(Solution().strStr("mississippi", "pi")) // 9

