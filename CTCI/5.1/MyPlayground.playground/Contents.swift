/**
 Given two 32 bits numbers, N and M and two bit position i and j
 Input: N = 10000000000, M = 10011, i = 2, j = 6
 */
import Foundation


let i = 2
print(i<<2) // 4
print(i<<3) // 8
print(i<<10) // 1024
print((~0)<<10)
// n
let c = String.init(1024, radix: 2, uppercase: true).count
let d: Double = pow(2, Double(c)) - 1
var n: Int = Int(exactly: d)!
for i in 2...6 {
    n = n ^ 1<<i
}
print(String.init(n, radix: 2, uppercase: true))

class Solution {
    func merge(_ n: Int, _ m: Int, _ i: Int, _ j: Int) -> Int {
        var n = n
        let shiftedM = m << i // [10011]00
        let nAmountOfBits: Double = Double(String.init(n, radix: 2, uppercase: true).count)
        var onesMask = Int(pow(2, nAmountOfBits) - 1)
        for shift in i...j {
            onesMask ^= 1<<shift // 11110000011
        }
        n &= onesMask
        n |= shiftedM
        return n
    }
}

let s = Solution()
print(s.merge(1040, 19, 2, 6))

class Solution1 {
    func reverseBits(_ n: Int) -> Int {
        let count = String.init(n, radix: 2, uppercase: true).count
        let nAmountOfBits: Double = Double(count)
        var mask = Int(pow(2, nAmountOfBits) - 1)
        print()
        print(String.init(mask, radix: 2, uppercase: true))
        for i in 0..<count {
            mask &= ~(n & 1<<i) << count - i
        }
        
        return mask
    }
}

let s1 = Solution1()
print(s1.reverseBits(43261596)) //964176192
