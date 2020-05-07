/**
 Given an encoded string, return its decoded string.

 The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times. Note that k is guaranteed to be a positive integer.

 You may assume that the input string is always valid; No extra white spaces, square brackets are well-formed, etc.

 Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, k. For example, there won't be input like 3a or 2[4].

 Examples:

 s = "3[a]2[bc]", return "aaabcbc".
 s = "3[a2[c]]", return "accaccacc".
 s = "2[abc]3[cd]ef", return "abcabccdcdcdef".
  
 */

class Solution {
    func decodeString(_ s: String) -> String {
//        var start: [(Int, Int)] = []
//        var s = s
//        var i = 0
//
//        while i < s.count {
//            let c = s[String.Index(encodedOffset: i)]
//
//            if c == "[" {
//                let times = Int(String(s[String.Index(encodedOffset: i - 1)])) ?? 0
//                start.append((times, i + 1))
//            } else if c == "]" {
//                let last = start.removeLast()
//                let distance = (i-1) - last.1
//                let generatedString: String
//                let range: Range<String.Index>
//                if distance == 0 {
//                    range = Range<String.Index>.init(uncheckedBounds: (lower: String.Index(encodedOffset: i - 3), upper: String.Index(encodedOffset: i+1)))
//                    generatedString = generate(encoded: String(s[String.Index(encodedOffset:i-1)]), times: last.0)
//                } else {
//                    let startIndex = String.Index(encodedOffset: last.1)
//                    let endIndex = String.Index(encodedOffset: i)
//                    let genrange = Range<String.Index>.init(uncheckedBounds: (lower: startIndex, upper: endIndex))
//                    generatedString = generate(encoded: String(s[genrange]), times: last.0)
//                    range = Range<String.Index>.init(uncheckedBounds: (lower: String.Index(encodedOffset: last.1 - 2), upper: String.Index(encodedOffset: i+1)))
//                }
//                s.replaceSubrange(range, with: generatedString)
//                i += generatedString.count - distance
//                i -= 3
//                continue
//            }
//
//            i += 1
//        }
//
//        return s
        var strArr = Array(s)
        var output = ""
        var start: Int?
        var times = 0
        var open = 0
        
        for idx in 0..<strArr.count {
            let strChar = String(strArr[idx])
            
            if strChar == "[" {
                start = open == 0 ? idx : start
                open += 1
            } else if strChar == "]" {
                open -= 1
                if open == 0, start != nil {
                    let toAppend = decodeString(String(strArr[start!+1..<idx]))
                    for _ in 0..<times {
                        output.append(toAppend)
                    }
                    start = nil
                    times = 0
                }
            } else if open == 0 {
                if let count = Int(strChar), count >= 0, count <= 1000 {
                    times = times * 10 + count
                } else {
                    output.append(strChar)
                }
            }
        }
        return output
    }
    
    func generate(encoded: String, times: Int) -> String {
        var result = ""
        for _ in 0..<times {
            result += encoded
        }
        return result
    }
}

print(Solution().decodeString("3[a]2[bc]"))
print(Solution().decodeString("3[a2[c]]"))
print(Solution().decodeString("2[abc]3[cd]ef"))
