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
    var results: [[Int]] = []
    
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var arr: [Int] = []
        hasPathSum(root, sum, &arr)
        return results
    }
    
    func hasPathSum(_ root: TreeNode?, _ sum: Int, _ arr: inout [Int]) -> Bool {
        guard root != nil else { return false }
        let nextSum = sum - (root?.val ?? 0)
        arr.append(root?.val ?? 0)
        if nextSum == 0 && root?.left == nil && root?.right == nil {
            results.append(arr)
            return true
        }
        
        var res: Bool = false
        if root?.left != nil {
            res = hasPathSum(root?.left, nextSum, &arr)
            arr.removeLast()
        }
        
        if root?.right != nil {
            res = hasPathSum(root?.right, nextSum, &arr)
            arr.removeLast()
        }
        
        return res
    }
}

let t1 = TreeNode(5)
t1.left = TreeNode(4)
t1.left?.left = TreeNode(11)
t1.left?.left?.left = TreeNode(7)
t1.left?.left?.right = TreeNode(2)
t1.right = TreeNode(8)
t1.right?.left = TreeNode(13)
t1.right?.right = TreeNode(4)
t1.right?.right?.left = TreeNode(5)
t1.right?.right?.right = TreeNode(1)

print(Solution().pathSum(t1, 22))
print(Solution().pathSum(nil, 0))

let t2 = TreeNode(1)
t2.left = TreeNode(2)
print(Solution().pathSum(t2, 1))

let t3 = TreeNode(-2)
t3.left = TreeNode(-3)
print(Solution().pathSum(t3, -5))
