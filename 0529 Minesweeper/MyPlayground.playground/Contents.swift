/**
 Let"s play the minesweeper game (Wikipedia, online game)!

 You are given a 2D char matrix representing the game board. "M" represents an unrevealed mine, "E" represents an unrevealed empty square, "B" represents a revealed blank square that has no adjacent (above, below, left, right, and all 4 diagonals) mines, digit ("1" to "8") represents how many mines are adjacent to this revealed square, and finally "X" represents a revealed mine.

 Now given the next click position (row and column indices) among all the unrevealed squares ("M" or "E"), return the board after revealing this position according to the following rules:

 If a mine ("M") is revealed, then the game is over - change it to "X".
 If an empty square ("E") with no adjacent mines is revealed, then change it to revealed blank ("B") and all of its adjacent unrevealed squares should be revealed recursively.
 If an empty square ("E") with at least one adjacent mine is revealed, then change it to a digit ("1" to "8") representing the number of adjacent mines.
 Return the board when no more squares will be revealed.
  

 Example 1:

 Input:

 [["E", "E", "E", "E", "E"],
  ["E", "E", "M", "E", "E"],
  ["E", "E", "E", "E", "E"],
  ["E", "E", "E", "E", "E"]]

 Click : [3,0]

 Output:

 [["B", "1", "E", "1", "B"],
  ["B", "1", "M", "1", "B"],
  ["B", "1", "1", "1", "B"],
  ["B", "B", "B", "B", "B"]]

 Explanation:

 Example 2:

 Input:

 [["B", "1", "E", "1", "B"],
  ["B", "1", "M", "1", "B"],
  ["B", "1", "1", "1", "B"],
  ["B", "B", "B", "B", "B"]]

 Click : [1,2]

 Output:

 [["B", "1", "E", "1", "B"],
  ["B", "1", "X", "1", "B"],
  ["B", "1", "1", "1", "B"],
  ["B", "B", "B", "B", "B"]]

 Explanation:

  

 Note:

 The range of the input matrix"s height and width is [1,50].
 The click position will only be an unrevealed square ("M" or "E"), which also means the input board contains at least one clickable square.
 The input board won"t be a stage when game is over (some mines have been revealed).
 For simplicity, not mentioned rules should be ignored in this problem. For example, you don"t need to reveal all the unrevealed mines when the game is over, consider any cases that you will win the game or flag any squares.
 */

class Solution {
    func updateBoard(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        var board = board
        openCell(&board, click[0], click[1], false)
        return board
    }
    
    func openCell(_ board: inout [[Character]], _ i: Int, _ j: Int, _ prevChar: Bool) {
        if i < 0 || i >= board.count || j < 0 || j >= board[i].count { return }
        if board[i][j] != "M" && board[i][j] != "E" { return }
        
        if prevChar == false, board[i][j] == "M" {
            board[i][j] = "X"
            return
        }
        
        if board[i][j] == "E" {
            let val = cellValue(board, i, j)
            board[i][j] = val
            if val != "B" { return }
        }
        
        let directions = [(-1, -1), (-1, 0), (-1, 1), (0, 1), (1, 1), (1, 0), (1, -1), (0, -1)]
        for dir in directions {
            openCell(&board, i + dir.0, j + dir.1, true)
        }
    }
    
    func cellValue(_ board: [[Character]], _ i: Int, _ j: Int) -> Character {
        let directions = [(-1, -1), (-1, 0), (-1, 1), (0, 1), (1, 1), (1, 0), (1, -1), (0, -1)]
        var chars: [Character] = []
        for dir in directions {
            if let c = neighbour(board, i + dir.0, j + dir.1) {
                chars.append(c)
            }
        }
        
        let mines = chars.filter({ $0 == "M" })
        return mines.isEmpty ? "B" : Character.init(String(mines.count))
    }
    
    func neighbour(_ board: [[Character]], _ i: Int, _ j: Int) -> Character? {
        if i < 0 || i >= board.count || j < 0 || j >= board[i].count { return nil }
        
        return board[i][j]
    }
}

let s = Solution()
let b: [[Character]] =  [["E", "E", "E", "E", "E"],
 ["E", "E", "M", "E", "E"],
 ["E", "E", "E", "E", "E"],
 ["E", "E", "E", "E", "E"]]
let b2 = s.updateBoard(b, [3, 0])
print(s.updateBoard(b2, [1,2]))
