/**
 Return the root node of a binary search tree that matches the given preorder traversal.

 (Recall that a binary search tree is a binary tree where for every node, any descendant of node.left has a value < node.val, and any descendant of node.right has a value > node.val.  Also recall that a preorder traversal displays the value of the node first, then traverses node.left, then traverses node.right.)

  

 Example 1:

 Input: [8,5,1,7,10,12]
 Output: [8,5,10,1,7,null,12]

  

 Note:

 1 <= preorder.length <= 100
 The values of preorder are distinct.
 */
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
        guard !preorder.isEmpty else { return nil }
        
        let node = TreeNode(preorder.first!)
        var stack: [TreeNode] = [node]
        
        for i in 1..<preorder.count {
            var next = stack.last
            while stack.last != nil && stack.last!.val < preorder[i] {
                next = stack.removeLast()
            }
            
            if preorder[i] > (next?.val ?? 0) {
                next?.right = TreeNode(preorder[i])
                stack.append(next!.right!)
            } else {
                next?.left = TreeNode(preorder[i])
                stack.append(next!.left!)
            }
            
        }
        
        return node
    }
}

dump(Solution().bstFromPreorder([8,5,1,7,10,12]))
