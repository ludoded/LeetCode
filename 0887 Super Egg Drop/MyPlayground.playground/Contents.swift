import UIKit
import CoreGraphics

class Solution {
    func superEggDrop(_ K: Int, _ N: Int) -> Int {
        guard K > 1 else {
            return N
        }
        
        var res = -1
        
        var floor = N
        for _ in 1..<K {
            var sum = 0
            var index = 1
            
            while sum < floor {
                sum += index
                index += 1
            }
            
            floor = index - 1
            res += 1
        }
        print(ceil(log2(Double(100))))
        print(res)
        return floor + res
    }
}

print(Solution.init().superEggDrop(2, 100))
//print(Solution.init().superEggDrop(3, 14))
//print(Solution.init().superEggDrop(1, 2))
//
//print(Solution.init().superEggDrop(3, 100)) // 6
//print(Solution.init().superEggDrop(7, 100)) // 7
//print(Solution.init().superEggDrop(100, 100)) //
//print(Solution.init().superEggDrop(3, 1)) //


