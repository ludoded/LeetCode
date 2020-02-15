
class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        solve(&board)
    }
    
    func solve(_ board: inout [[Character]]) -> Bool {
        for i in 0..<9 {
            for j in 0..<9 {
                if board[i][j] == "." {
                    var res: Bool = false
                    for n in 1...9 {
                        let char = Character("\(n)")
                        if possibleToStore(board, i, j, char) {
                            board[i][j] = char
                            res = solve(&board)
                            if res == false {
                                board[i][j] = "."
                            }
                        }
                    }
                    return res
                }
            }
        }
        
        return true
    }
    
    func possibleToStore(_ board: [[Character]], _ x: Int, _ y: Int, _ n: Character) -> Bool {
        for i in 0..<9 {
            if board[x][i] == n {
                return false
            }
        }
        
        for j in 0..<9 {
            if board[j][y] == n {
                return false
            }
        }

        let gridX = Int(x / 3) * 3
        let grixY = Int(y / 3) * 3
        for i in 0..<3 {
            for j in 0..<3 {
                if board[gridX + i][grixY + j] == n {
                    return false
                }
            }
        }
        
        return true
    }
}


var a: [[Character]] = [
  ["5","3",".",".","7",".",".",".","."],
  ["6",".",".","1","9","5",".",".","."],
  [".","9","8",".",".",".",".","6","."],
  ["8",".",".",".","6",".",".",".","3"],
  ["4",".",".","8",".","3",".",".","1"],
  ["7",".",".",".","2",".",".",".","6"],
  [".","6",".",".",".",".","2","8","."],
  [".",".",".","4","1","9",".",".","5"],
  [".",".",".",".","8",".",".","7","9"]
]
Solution().solveSudoku(&a)
print(a)

