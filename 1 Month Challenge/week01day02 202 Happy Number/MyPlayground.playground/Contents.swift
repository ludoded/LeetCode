class Solution {
    func isHappy(_ n: Int) -> Bool {
        var results: Set<Int> = []
        var current = n
        
        while !results.contains(current) {
            if current == 1 { return true }
            results.insert(current)
            current = sumOfSquares(current)
        }
        
        return false
    }
    
    private func sumOfSquares(_ num: Int) -> Int {
        var numbers: [Int] = []
        var number = num
        
        while number > 0 {
            let digit = number % 10
            number /= 10
            numbers.append(digit)
        }
        
        return numbers.reduce(0, { $0 + $1 * $1 })
    }
}

print(Solution().isHappy(11)) // false
print(Solution().isHappy(19)) // true
print(Solution().isHappy(100)) // true
