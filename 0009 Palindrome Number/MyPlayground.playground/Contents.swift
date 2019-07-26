import UIKit

/**
 Determine whether an integer is a palindrome. An integer is a palindrome when it reads the same backward as forward.
 
 Example 1:
 
 Input: 121
 Output: true
 Example 2:
 
 Input: -121
 Output: false
 Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
 Example 3:
 
 Input: 10
 Output: false
 Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
 Follow up:
 
 Coud you solve it without converting the integer to a string?
 */

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        
        var i = x
        var digits: [Int] = []
        
        while i/10 > -1 {
            print(i)
            let appendDigit = i % 10
            i = i / 10
            digits.append(appendDigit)
            if i <= 0 {
                break
            }
        }
        
        return isArrPalindrome(arr: digits)
    }
    
    func isArrPalindrome(arr: [Int]) -> Bool {
        guard !arr.isEmpty else { return false }
        
        print(arr)
        let midPoint = Int(arr.count / 2)
        let isEven = arr.count % 2 == 0
        var left = isEven ? midPoint - 1 : midPoint
        var right = isEven ? midPoint : midPoint
        print(left, " ", right)
        
        while left >= 0 {
            if arr[left] != arr[right] {
                return false
            }
            left -= 1
            right += 1
        }
        
        return true
    }
}

print(Solution().isPalindrome(-1)) // false
print(Solution().isPalindrome(0)) //true
print(Solution().isPalindrome(-101)) //false
print(Solution().isPalindrome(1)) // true
print(Solution().isPalindrome(2020202)) //true
print(Solution().isPalindrome(10010)) // false
print(Solution().isPalindrome(Int.max)) // false
print(Solution().isPalindrome(10)) // false
print(Solution().isPalindrome(101)) // true

