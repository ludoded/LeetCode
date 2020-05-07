/**
 Given an array of strings, group anagrams together.

 Example:

 Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
 Output:
 [
   ["ate","eat","tea"],
   ["nat","tan"],
   ["bat"]
 ]
 Note:

 All inputs will be in lowercase.
 The order of your output does not matter.
 */

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var groups: [String: Array<String>] = [:]
        
        for word in strs {
            let sortedLetters = String(word.sorted())
            if groups.index(forKey: sortedLetters) == nil {
                groups[sortedLetters] = []
            }
            groups[sortedLetters]?.append(word)
        }
        
        return groups.map({ $0.value })
    }
}

print(Solution().groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
