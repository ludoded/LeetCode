/**
 Implement a basic calculator to evaluate a simple expression string.

 The expression string may contain open ( and closing parentheses ), the plus + or minus sign -, non-negative integers and empty spaces .

 Example 1:

 Input: "1 + 1"
 Output: 2
 Example 2:

 Input: " 2-1 + 2 "
 Output: 3
 Example 3:

 Input: "(1+(4+5+2)-3)+(6+8)"
 Output: 23
 Note:
 You may assume that the given expression is always valid.
 Do not use the eval built-in library function.
 */

class Solution {
    func calculate(_ s: String) -> Int {
        var stack: [Int] = []
        let s = Array(s).map({ String($0) })
        var lastSign = 1
        var signs: [Int] = [1]
        var inPar = 0
        var num: String = ""
        
        for c in s {
            dump(stack)
            if Int(c) == nil && !num.isEmpty {
                stack.append(Int(num)! * signs.last! * lastSign )
                num = ""
            }
            
            if c == "(" {
                signs.append(lastSign)
                inPar += 1
                lastSign = 1
            } else if c == ")" {
                signs.removeLast()
                inPar -= 1
            } else if c == "+" {
                lastSign = 1
            } else if c == "-" {
                lastSign = -1
            } else if let _ = Int(c) {
                num.append(c)
            } else {
                continue
            }
        }
        
        if !num.isEmpty {
            stack.append(Int(num)! * lastSign )
        }
        
        return stack.reduce(0, +)
    }
}

let s = Solution()

//print(s.calculate("1 + 1")) // 2
//print(s.calculate("2 - 1 + 2")) // 3
print(s.calculate("2 - (1 - (3 - ( 4 + 2)))")) // 0

//print(s.calculate("(1+(4+5+2)-3)+(6+8)")) // 23
//print(s.calculate("(1-(4+5+2)-3)-(6+8)")) // -27
