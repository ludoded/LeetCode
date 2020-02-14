/**
 Given two binary search trees, return True if and only if there is a node in the first tree and a node in the second tree whose values sum up to a given integer target.

  

 Example 1:



 Input: root1 = [2,1,4], root2 = [1,0,3], target = 5
 Output: true
 Explanation: 2 and 3 sum up to 5.
 Example 2:



 Input: root1 = [0,-10,10], root2 = [5,1,7,0,2], target = 18
 Output: false
  

 Constraints:

 Each tree has at most 5000 nodes.
 -10^9 <= target, node.val <= 10^9
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
    func isSumUp(_ root2: TreeNode?, _ target: Int) -> Bool {
        guard root2 != nil else { return false }

        if root2!.val == target {
            return true
        } else if root2!.val > target {
            return isSumUp(root2?.left, target)
        } else if root2!.val < target {
            return isSumUp(root2?.right, target)
        }
        
        return false
    }
    
    func twoSumBSTs(_ root1: TreeNode?, _ root2: TreeNode?, _ target: Int) -> Bool {
        guard root1 != nil else { return false }
        
        var res: Bool = false
        if root1?.left != nil {
            res = twoSumBSTs(root1?.left, root2, target)
            if res == true { return true }
        }
        if root1?.right != nil {
            res = twoSumBSTs(root1?.right, root2, target)
            if res == true { return true }
        }
        
        return isSumUp(root2, target - root1!.val)
    }
}

var t11 = TreeNode(2)
t11.left = TreeNode(1)
t11.right = TreeNode(4)
var t12 = TreeNode(1)
t12.left = TreeNode(0)
t12.right = TreeNode(3)
print(Solution().twoSumBSTs(t11, t12, 5))

//var t21 = TreeNode(0)
//t21.left = TreeNode(-10)
//t21.right = TreeNode(10)
//var t22 = TreeNode(5)
//t22.left = TreeNode(1)
//t22.left?.left = TreeNode(0)
//t22.left?.right = TreeNode(2)
//t22.right = TreeNode(7)
//print(Solution().twoSumBSTs(t21, t22, 18))


