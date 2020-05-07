/**
 Given a string containing only three types of characters: '(', ')' and '*', write a function to check whether this string is valid. We define the validity of a string by these rules:

 Any left parenthesis '(' must have a corresponding right parenthesis ')'.
 Any right parenthesis ')' must have a corresponding left parenthesis '('.
 Left parenthesis '(' must go before the corresponding right parenthesis ')'.
 '*' could be treated as a single right parenthesis ')' or a single left parenthesis '(' or an empty string.
 An empty string is also valid.
 Example 1:

 Input: "()"
 Output: True
 Example 2:

 Input: "(*)"
 Output: True
 Example 3:

 Input: "(*))"
 Output: True
 Note:

 The string size will be in the range [1, 100].
 */

class Solution {
//    func checkValidString(_ s: String) -> Bool {
//        var depth: [Int] = [0]
//
//        for c in s {
//            if c == "(" {
//                depth = depth.map({ $0 + 1 })
//            } else if c == ")" {
//                if let _ = depth.firstIndex(where: { $0 > 0 }) {
//                    depth = depth.map({ $0 - 1 })
//                } else {
//                    return false
//                }
//            } else if c == "*" {
//                if let _ = depth.firstIndex(where: { $0 > 0 }) {
//                    depth.insert(depth.first! - 1, at: 0)
//                }
//                depth.append(depth.last! + 1)
//            }
//            print(depth)
//        }
//        return depth.contains(0)
//    }
    func checkValidString(_ s: String) -> Bool {
        var t = (0, 0)
        for c in s {
            t.1 += (c != ")" ? 1 : -1)
            if t.1 < 0 { return false }
            t.0 += (c == "(" ? 1 : -1)
            t.0 = max(t.0, 0)
        }
        return t.0 == 0
    }
}


print(Solution().checkValidString("(()")) // false
print(Solution().checkValidString("())")) // false
print(Solution().checkValidString(")(())")) // false
print(Solution().checkValidString(")(")) // false
print(Solution().checkValidString(")")) // false
print(Solution().checkValidString("(*)))")) // false
print(Solution().checkValidString("*(")) // false
print(Solution().checkValidString("*))")) // false
print(Solution().checkValidString("((())()()(*)(*()(())())())()()((()())(*")) // false
print(Solution().checkValidString("")) // true
print(Solution().checkValidString("(()())")) // true
print(Solution().checkValidString("()")) // true
print(Solution().checkValidString("(*)")) // true
print(Solution().checkValidString("(*))")) // true
print(Solution().checkValidString("(******)")) // true
print(Solution().checkValidString("******)")) // true
print(Solution().checkValidString("(******")) // true
print(Solution().checkValidString("******")) // true
