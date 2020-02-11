import UIKit

class Solution {
    func plusOne(_ A: inout [Int]) -> [Int] {
        var res = A
        for (i, el) in A.reversed().enumerated() {
            let incrementedEl = el + 1
            res[A.endIndex - i - 1] = incrementedEl % 10
            if incrementedEl < 10 {
                break
            } else if i == (A.endIndex - 1) {
                res.insert(1, at: 0)
                break
            }
        }
        
        var lastZeroIndex: Int = -1
        for el in res {
            if el == 0 {
                lastZeroIndex += 1
            } else {
                break
            }
        }
        
        if lastZeroIndex >= 0 {
            res.removeSubrange(0...lastZeroIndex)
        }
        
        return res
    }
}

var a = [0,0,8,9,9,7]
print(Solution().plusOne(&a))
