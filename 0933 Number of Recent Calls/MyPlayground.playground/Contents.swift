import UIKit

class RecentCounter {
    var arr: [Int]
    init() {
        self.arr = []
    }
    
    func ping(_ t: Int) -> Int {
        arr.append(t)
        
        while arr.count > 1, t - arr.first! > 3000 {
            arr.removeFirst()
        }
        
        return arr.count
    }
}

/**
 * Your RecentCounter object will be instantiated and called as such:
 * let obj = RecentCounter()
 * let ret_1: Int = obj.ping(t)
 */
