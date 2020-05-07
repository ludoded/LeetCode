/**
 Given a range [m, n] where 0 <= m <= n <= 2147483647, return the bitwise AND of all numbers in this range, inclusive.

 Example 1:

 Input: [5,7]
 Output: 4
 Example 2:

 Input: [0,1]
 Output: 0
 */

class Solution {
    func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
        var n = n
        while m < n {
            n = n & (n-1)
        }
        return m & n
    }
}

print(Solution().rangeBitwiseAnd(5, 7)) // 4
print(Solution().rangeBitwiseAnd(0, 2147483647)) // 0
