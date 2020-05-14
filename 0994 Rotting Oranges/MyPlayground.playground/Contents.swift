/**
 In a given grid, each cell can have one of three values:

 the value 0 representing an empty cell;
 the value 1 representing a fresh orange;
 the value 2 representing a rotten orange.
 Every minute, any fresh orange that is adjacent (4-directionally) to a rotten orange becomes rotten.

 Return the minimum number of minutes that must elapse until no cell has a fresh orange.  If this is impossible, return -1 instead.

  

 Example 1:



 Input: [[2,1,1],[1,1,0],[0,1,1]]
 Output: 4
 Example 2:

 Input: [[2,1,1],[0,1,1],[1,0,1]]
 Output: -1
 Explanation:  The orange in the bottom left corner (row 2, column 0) is never rotten, because rotting only happens 4-directionally.
 Example 3:

 Input: [[0,2]]
 Output: 0
 Explanation:  Since there are already no fresh oranges at minute 0, the answer is just 0.
 */

class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        let r = grid.count, c = grid[0].count, directs = [(0, 1), (1, 0), (-1, 0), (0, -1)]
        var freshCount = 0, step = 0
        var rottenArr = [(Int, Int)](), nextRottenArr = [(Int, Int)](),  grid = grid
        for i in 0..<r { for j in 0..<c {
            if grid[i][j] == 1 { freshCount += 1 }
            else if grid[i][j] == 2 { rottenArr.append((i, j)) }
        }}
        if freshCount == 0 { return 0 }

        while !rottenArr.isEmpty {
            let (x, y) = rottenArr.removeFirst()
            for d in directs {
                let (cx, cy) = (x+d.0, y+d.1)
                if cx >= 0 && cy < c && cx < r && cy >= 0  && grid[cx][cy] == 1 {
                    grid[cx][cy] = 2
                    freshCount -= 1
                    nextRottenArr.append((cx, cy))
                }
            }
            if rottenArr.isEmpty {
                step += 1
                if freshCount == 0 { return step }
                rottenArr = nextRottenArr
                nextRottenArr.removeAll()
            }
        }
        return freshCount == 0 ? step : -1
    }
}

let s = Solution()
s.orangesRotting([[2,1,1],[0,1,1],[1,0,1]]) // -1
s.orangesRotting([[2,1,1],[1,1,0],[0,1,1]]) // 4
s.orangesRotting([[0,2]]) // 0
