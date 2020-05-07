/**
 Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent.

 A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.



 Example:

 Input: "23"
 Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 Note:

 Although the above answer is in lexicographical order, your answer could be in any order you want.
 */

class Solution {
    var dict: [String: [String]] = [
        "0": [" "],
        "2": ["a", "b", "c"],
        "3": ["d", "e", "f"],
        "4": ["g", "h", "i"],
        "5": ["j", "k", "l"],
        "6": ["m", "n", "o"],
        "7": ["p", "q", "r", "s"],
        "8": ["t", "u", "v"],
        "9": ["w", "x", "y", "z"]
    ]
    
    func letterCombinations(_ digits: String) -> [String] {
        var digits = digits.filter({ $0 != "1" })
        guard !digits.isEmpty
            else { return [] }
        
        let firstDigit = String(digits.removeFirst())
        var words: [String] = letters(for: firstDigit)
        
        for digit in digits {
            var res: [String] = []
            let letters = self.letters(for: String(digit))
            for word in words {
                for letter in letters {
                    res.append(word + letter)
                }
            }
            words = res
        }
        
        return words
    }
    
    func letters(for digit: String) -> [String] {
        let letters = dict[digit] ?? []
        var result: [String] = []
        for letter in letters {
            result.append(letter)
        }
        return result
    }
}

print(Solution().letterCombinations("11203"))
print(Solution().letterCombinations("11"))
print(Solution().letterCombinations("101"))
print(Solution().letterCombinations("000"))
print(Solution().letterCombinations(""))
