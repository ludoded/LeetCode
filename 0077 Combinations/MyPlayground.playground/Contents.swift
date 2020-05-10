/**
 Given two integers n and k, return all possible combinations of k numbers out of 1 ... n.

 Example:

 Input: n = 4, k = 2
 Output:
 [
   [2,4],
   [3,4],
   [2,3],
   [1,2],
   [1,3],
   [1,4],
 ]
 */

class Solution {
    var results: [[Int]] = []
    var candidate: [Int] = []
    var n: Int!
    var k: Int!
    
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        self.n = n
        self.k = k
        
        backtrack(1)
        return results
    }
    
    private func backtrack(_ idx: Int) {
        if idx > n { return }
        for i in idx...n {
            if candidate.count < k {
                candidate.append(i)
                backtrack(i + 1)
                if candidate.count == k {
                    results.append(candidate)
                }
                print(candidate)
                candidate.removeLast()
            } else if candidate.count == k {
                return
            }
        }
    }
}

/**
 
 */

let s = Solution()

print(s.combine(4, 2))
print(s.combine(5, 3))
