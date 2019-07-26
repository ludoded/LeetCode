import UIKit

struct Stack<T> {
    private var arr: [T] = []
    
    func peek() -> T? {
        return arr.last
    }
    
    mutating func push(_ obj: T) {
        arr.append(obj)
    }
    
    mutating func pop() -> T? {
        return arr.popLast()
    }
    
    func isEmpty() -> Bool {
        return arr.isEmpty
    }
}

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = Stack<Character>()
        
        for c in s {
            if c.isOpened() {
                stack.push(c)
            } else if c.isClosed() {
                if let last = stack.peek() {
                    if last.canClose(bracket: c) {
                        stack.pop()
                    } else {
                        return false
                    }
                } else {
                    return false
                }
            }
        }
        
        return stack.isEmpty()
    }
}

extension Character {
    func isOpened() -> Bool {
        return self == "(" || self == "[" || self == "{"
    }
    
    func isClosed() -> Bool {
        return self == ")" || self == "]" || self == "}"
    }
    
    func canClose(bracket: Character) -> Bool {
        switch (self, bracket) {
        case ("(", ")"),("[", "]"),("{", "}"):
            return true
        default: return false
        }
    }
}


print(Solution().isValid("([)]")) // false
print(Solution().isValid("()[]{}")) // true
print(Solution().isValid("{[]}")) // true
print(Solution().isValid("{{{[]}}")) // false
print(Solution().isValid("}")) // false
print(Solution().isValid("{")) // false
print(Solution().isValid("")) // trur

