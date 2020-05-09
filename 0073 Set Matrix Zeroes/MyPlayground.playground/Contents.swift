/**
 Given a m x n matrix, if an element is 0, set its entire row and column to 0. Do it in-place.

 Example 1:

 Input:
 [
   [1,1,1],
   [1,0,1],
   [1,1,1]
 ]
 Output:
 [
   [1,0,1],
   [0,0,0],
   [1,0,1]
 ]
 Example 2:

 Input:
 [
   [0,1,2,0],
   [3,4,5,2],
   [1,3,1,5]
 ]
 Output:
 [
   [0,0,0,0],
   [0,4,5,0],
   [0,3,1,0]
 ]
 Follow up:

 A straight forward solution using O(mn) space is probably a bad idea.
 A simple improvement uses O(m + n) space, but still not the best solution.
 Could you devise a constant space solution?
 */

class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        guard !matrix.isEmpty, let f = matrix.first, !f.isEmpty else { return }
        
        var columns: Set<Int> = []
        var rows: Set<Int> = []
        let row = matrix.count
        let column = matrix[0].count
        
        for r in 0..<row {
            for c in 0..<column {
                if matrix[r][c] == 0 {
                    rows.insert(r)
                    columns.insert(c)
                    
                    for emptyCol in 0..<c {
                        matrix[r][emptyCol] = 0
                    }
                    for emptyRow in 0..<r {
                        matrix[emptyRow][c] = 0
                    }
                    
                }
                if columns.contains(c) || rows.contains(r) {
                    matrix[r][c] = 0
                }
            }
        }
    }
}

var m1 = [
[1,1,1],
[1,0,1],
[1,1,1]
]
Solution().setZeroes(&m1)
print(m1)

var m2 = [
[0,1,2,0],
[3,4,5,2],
[1,3,1,5]
]
Solution().setZeroes(&m2)
print(m2)
