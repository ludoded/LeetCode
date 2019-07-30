/**
 Given a 32-bit signed integer, reverse digits of an integer.
 
 Example 1:
 
 Input: 123
 Output: 321
 Example 2:
 
 Input: -123
 Output: -321
 Example 3:
 
 Input: 120
 Output: 21
 Note:
 Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
 */

import UIKit

class Solution {
    func reverse(_ x: Int) -> Int {
        var initNumber = abs(x)
        var newNumber = 0
        while initNumber / 10 > -1 {
            let remain = initNumber % 10
            newNumber = (newNumber * 10) + remain
            
            if initNumber / 10 <= 0 {
                break
            }
            initNumber = Int(initNumber / 10)
            
        }
        
        let isNegative = x < 0
        newNumber *= isNegative ? -1 : 1
        
        let lowerLimit = -2147483648
        let upperLimit = 2147483647
        guard newNumber >= lowerLimit, newNumber <= upperLimit
            else { return 0}
        
        return newNumber
    }
}

print(Solution().reverse(120))
print(Solution().reverse(1203))
print(Solution().reverse(-123))
print(Solution().reverse(0))
print(Solution().reverse(Int.max))
