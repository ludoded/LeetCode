/**
 Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

 Example 1:

 Input:
 11110
 11010
 11000
 00000

 Output: 1
 Example 2:

 Input:
 11000
 11000
 00100
 00011

 Output: 3
 */

class Solution {
    func lookup(_ grid: inout [[Character]], atRow i: Int, atColumn j: Int) {
        if grid[i][j] == "0" {
            return
        }
        
        grid[i][j] = "0"
        
        if i > 0 {
            lookup(&grid, atRow: i-1, atColumn: j)
        }
        if i < grid.count - 1 {
            lookup(&grid, atRow: i+1, atColumn: j)
        }
        if j > 0 {
            lookup(&grid, atRow: i, atColumn: j-1)
        }
        if j < grid[i].count - 1 {
            lookup(&grid, atRow: i, atColumn: j+1)
        }
    }
    
    func numIslands(_ grid: [[Character]]) -> Int {
        guard !grid.isEmpty else { return 0 }
        
        var grid = grid
        var islands: Int = 0
        
        for (i, row) in grid.enumerated() {
            for (j, _) in row.enumerated() {
                if grid[i][j] == "1" {
                    islands += 1
                    lookup(&grid, atRow: i, atColumn: j)
                }
            }
        }
        
        return islands
    }
}

let sea1: [[Character]] = [
["1","1","1","1","0"],
["1","1","0","1","0"],
["1","1","0","0","0"],
["0","0","0","0","0"],
]

let sea2: [[Character]] = [
["1","1","0","0","0"],
["1","1","0","1","0"],
["0","0","1","0","0"],
["0","0","0","1","1"],
]

print(Solution().numIslands(sea1)) // 1
print(Solution().numIslands(sea2)) // 4

