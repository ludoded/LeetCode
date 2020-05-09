/**
 Given a linked list, rotate the list to the right by k places, where k is non-negative.

 Example 1:

 Input: 1->2->3->4->5->NULL, k = 2
 Output: 4->5->1->2->3->NULL
 Explanation:
 rotate 1 steps to the right: 5->1->2->3->4->NULL
 rotate 2 steps to the right: 4->5->1->2->3->NULL
 Example 2:

 Input: 0->1->2->NULL, k = 4
 Output: 2->0->1->NULL
 Explanation:
 rotate 1 steps to the right: 2->0->1->NULL
 rotate 2 steps to the right: 1->2->0->NULL
 rotate 3 steps to the right: 0->1->2->NULL
 rotate 4 steps to the right: 2->0->1->NULL
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        var arr: [ListNode] = []
        var next = head
        
        while next != nil {
            arr.append(next!)
            next = next?.next
        }
        
        guard !arr.isEmpty else { return nil }
        
        let count = arr.count
        let rotateIndex = k % count
        
        arr.last?.next = arr.first
        arr[count - rotateIndex - 1].next = nil
        
        let returnIndex = (count - rotateIndex) % count
        return arr[returnIndex]
    }
}

let l1 = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
dump(Solution().rotateRight(l1, 2)) // 4-5-1-2-3
let l2 = ListNode(1, ListNode(2, ListNode(3)))
dump(Solution().rotateRight(l2, 4)) // 3-1-2
