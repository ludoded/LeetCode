/**
 
 */
func solution(_ S : inout String) -> Int {
    var stack: [Int64] = []
    stack.co
    var operations = S.components(separatedBy: " ")
    for operation in operations {
        if let number = Int64(operation) {
            stack.append(number)
        } else if operation == "DUP" {
            if stack.last == nil {
                return -1
            }
            let last = stack.last!
            stack.append(last)
        } else if operation == "POP" {
            if stack.last == nil {
                return -1
            }
            stack.removeLast()
        } else if operation == "+" {
            if let last = stack.removeLast(), let secondToEnd = stack.removeLast() {
                stack.append(last + secondToEnd)
            } else {
                return -1
            }
        } else if operation == "-" {
            if let last = stack.removeLast(), let secondToEnd = stack.removeLast() {
                stack.append(last - secondToEnd)
            } else {
                return -1
            }
        }
    }
    
    if stack.isEmpty {
        return -1
    }
    
    return Int(stack.last ?? 0)
}
