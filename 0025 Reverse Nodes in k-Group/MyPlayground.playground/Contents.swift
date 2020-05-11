/**
 Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.

 k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.

 Example:

 Given this linked list: 1->2->3->4->5

 For k = 2, you should return: 2->1->4->3->5

 For k = 3, you should return: 3->2->1->4->5

 Note:

 Only constant extra memory is allowed.
 You may not alter the values in the list's nodes, only nodes itself may be changed.
 */

 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }
 
class Solution {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard k > 0 else { return head }
        var count = 0
        var n = head
        while n != nil {
            count += 1
            n = n?.next
        }
        
        var first: ListNode? = head
        var last: ListNode? = head
        var prev: ListNode? = head
        var node: ListNode? = head
        var next: ListNode? = node?.next
        var ret: ListNode? = nil
        let loops = count / k // how many loops of reverses
        var portion = 1
        
        for i in 0..<loops {
            while portion <= k && next != nil {
                next = node?.next
                node?.next = prev
                prev = node
                node = next
                portion += 1
            }
            print()
            print("first", first?.val)
            let f = first
            portion = 1
            first?.next = next
            first = node
            print("prev", prev?.val)
            print("node", node?.val)
            print("next", next?.val)
            print("last", last?.val)
            
            if i == 0 {
                ret = prev
            } else {
                last?.next = prev
                last = f
            }
            print("mutate last", last?.val)
        }
        
        dump(ret)
        return ret
    }
}

let s = Solution()
let l = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, ListNode(6, ListNode(7, ListNode(8, ListNode(9, ListNode(10, ListNode(11, ListNode(12))))))))))))
s.reverseKGroup(l, 3) // 3-2-1-6-5-4-9-8-7-12-11-10
                      // 3-2-1-6-9-12-11-10

let list = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
s.reverseKGroup(list, 2) // 2-1-4-3-5

let list1 = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
s.reverseKGroup(list1, 3) // 3-2-1-4-5

let list2 = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
s.reverseKGroup(list2, 5) // 5-4-3-2-1

let list3 = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
s.reverseKGroup(list3, 0) // 1-2-3-4-5

let list4 = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
s.reverseKGroup(list4, 6) // 5-4-3-2-1
