/**
 Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.

 push(x) -- Push element x onto stack.
 pop() -- Removes the element on top of the stack.
 top() -- Get the top element.
 getMin() -- Retrieve the minimum element in the stack.
  

 Example:

 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin();   --> Returns -3.
 minStack.pop();
 minStack.top();      --> Returns 0.
 minStack.getMin();   --> Returns -2.
  
 */


class MinStack {

    /** initialize your data structure here. */
    init() {
        self.sortedtMins = []
        self.stack = []
    }
    
    func push(_ x: Int) {
        stack.append(x)
        
        // push min
        let index = insertionIndex(in: sortedtMins, for: x)
        sortedtMins.insert(x, at: index)
    }
    
    func pop() {
        let popped = stack.removeLast()
        
        let index = sortedIndex(in: sortedtMins, for: popped)
        sortedtMins.remove(at: index)
    }
    
    func top() -> Int {
        return stack.last ?? 0
    }
    
    func getMin() -> Int {
        return sortedtMins.first ?? 0
    }
    
    // Private
    private var sortedtMins: [Int]
    private var stack: [Int]
    
    private func insertionIndex(in array: [Int], for value: Int) -> Int {
        var slice = array[...]

        while !slice.isEmpty {
            let middle = slice.index(slice.startIndex, offsetBy: slice.count / 2)
            if value < slice[middle] {
                slice = slice[..<middle]
            } else {
                slice = slice[array.index(after: middle)...]
            }
        }
        return slice.startIndex
    }
    
    private func sortedIndex(in array: [Int], for value: Int) -> Int {
        var slice = array[...]

        while !slice.isEmpty {
            let middle = slice.index(slice.startIndex, offsetBy: slice.count / 2)
            if value < slice[middle] {
                slice = slice[..<middle]
            } else if value > slice[middle] {
                slice = slice[array.index(after: middle)...]
            } else {
                return middle
            }
        }
        return slice.startIndex
    }
}

let min1 = MinStack()
min1.push(-2)
min1.push(0)
min1.push(-3)
min1.getMin() // -3
min1.pop()
min1.top() // 0
min1.getMin() // -2
