/**
 Given a linked list, remove the n-th node from the end of list and return its head.

 Example:

 Given linked list: 1->2->3->4->5, and n = 2.

 After removing the second node from the end, the linked list becomes 1->2->3->5.
 Note:

 Given n will always be valid.

 Follow up:

 Could you do this in one pass?
 */
//Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard n > 0 else { return head }
        var nodes: [ListNode?] = []
        var next = head
        
        while next != nil {
            nodes.append(next)
            next = next?.next
        }
        
        let index = nodes.count - n
        if index == 0 {
            return (nodes.count > 1) ? nodes[1] : nil
        }
        
        nodes[index - 1]?.next = ((index + 1) < nodes.count) ? nodes[index + 1] : nil
        return head
    }
}

let l = ListNode(1)
l.next = ListNode(2)
l.next?.next = ListNode(3)
l.next?.next?.next = ListNode(4)
l.next?.next?.next?.next = ListNode(5)
dump(Solution().removeNthFromEnd(l, 2))
