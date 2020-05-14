/**
 Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).

 For example:
 Given binary tree [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 return its level order traversal as:

 [
   [3],
   [9,20],
   [15,7]
 ]
 */


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var nodes = [root]
        var res: [[Int]] = []
        while !nodes.isEmpty {
            var vals: [Int] = []
            for node in nodes {
                if node != nil {
                    vals.append(node!.val)
                }
            }
            if !vals.isEmpty {
                res.append(vals)
            }
            nodes = nodes.map({ [$0?.left, $0?.right] }).flatMap({ $0 }).compactMap({ $0 })
        }
        
        return res
    }
}

let s = Solution()
let t = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
print(s.levelOrder(t)) ///[[3], [9,20], [15,7]]
