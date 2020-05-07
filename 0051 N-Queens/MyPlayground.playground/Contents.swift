/**
 The n-queens puzzle is the problem of placing n queens on an n×n chessboard such that no two queens attack each other.



 Given an integer n, return all distinct solutions to the n-queens puzzle.

 Each solution contains a distinct board configuration of the n-queens' placement, where 'Q' and '.' both indicate a queen and an empty space respectively.

 Example:

 Input: 4
 Output: [
  [".Q..",  // Solution 1
   "...Q",
   "Q...",
   "..Q."],

  ["..Q.",  // Solution 2
   "Q...",
   "...Q",
   ".Q.."]
 ]
 Explanation: There exist two distinct solutions to the 4-queens puzzle as shown above.
 */

class Solution {
    private let q = "Q"
    private let dot = "."
    private var result: Set<[String]> = []
    
    func solveNQueens(_ n: Int) -> [[String]] {
        /// return if n is less than 1
        guard n > 0 else { return [[]] }
        
        /// return 1 Q if n == 1
        guard n > 1 else { return [[q]] }
        
        /// Pre populate the data
        var data: [[String]] = []
        for _ in 1...n {
            let array = Array(repeating: dot, count: n)
            data.append(array)
        }
        placeQueens(&data)
        
        return Array(result)
    }
    
    private func placeQueens(_ data: inout [[String]]) {
        let n = data.count
        for x in 0..<n {
            for y in 0..<n {
                if canPlaceQueen(data, x, y) {
                    data[x][y] = q
                    placeQueens(&data)
                    data[x][y] = dot
                }
            }
        }
        let noQRow = data.filter({ !$0.contains(q) })
        if noQRow.isEmpty {
            let res = data.map({ $0.joined() })
            
            result.insert(res)
        }
        
        return
    }
    
    private func canPlaceQueen(_ data: [[String]], _ x: Int, _ y: Int) -> Bool {
        let n = data.count
        /// Check left from point
        for i in 0..<n {
            if data[x][i] == q {
                return false
            }
        }
        
        /// Check top from point
        for i in 0..<n {
            if data[i][y] == q {
                return false
            }
        }
        
        /// Check diagonales for top-left and top-right from point
        var upLevel = 1
        for i in (0..<x).reversed() {
            let topLeft = y - upLevel
            let topRight = y + upLevel
            if topLeft >= 0 && data[i][topLeft] == q {
                return false
            }
            
            if topRight < data.count && data[i][topRight] == q {
                return false
            }
            
            upLevel += 1
        }
        
        var downLevel = 0
        for i in x..<n {
            let downLeft = y - downLevel
            let downRight = y + downLevel
            if downLeft >= 0 && data[i][downLeft] == q {
                return false
            }
            
            if downRight < data.count && data[i][downRight] == q {
                return false
            }
            
            downLevel += 1
        }
        
        return true
    }
}

print(Solution().solveNQueens(1))
print(Solution().solveNQueens(2))
//print(Solution().solveNQueens(4))
print(Solution().solveNQueens(5))
