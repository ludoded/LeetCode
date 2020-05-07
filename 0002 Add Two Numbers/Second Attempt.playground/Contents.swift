/**
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.

 Example:

 Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 Output: 7 -> 0 -> 8
 Explanation: 342 + 465 = 807.
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil  && l2 == nil { return nil }
        let res = ListNode(0)
        addNumbers(l1, l2, res, hasAdd: false)
        return res
    }
    
    func addNumbers(_ l1: ListNode?, _ l2: ListNode?, _ res: ListNode?, hasAdd: Bool) {
        var sum = (l1?.val ?? 0) + (l2?.val ?? 0)
        sum += hasAdd ? 1 : 0
        // modulate with 10
        let value = sum % 10
        res?.val = value

        let nextHasAdd = sum > 9
        
        if l1?.next != nil || l2?.next != nil || nextHasAdd {
            res?.next = ListNode(0)
            addNumbers(l1?.next, l2?.next, res?.next, hasAdd: nextHasAdd)
        }
        
        return
    }
}

let l1 = ListNode(2)
l1.next = ListNode(4)
l1.next?.next = ListNode(3)
let l2 = ListNode(5)
l2.next = ListNode(6)
l2.next?.next = ListNode(4)

dump(Solution().addTwoNumbers(l1, l2))

let l3 = ListNode(9)
l3.next = ListNode(9)
l3.next?.next = ListNode(9)
let l4 = ListNode(9)
l4.next = ListNode(9)
l4.next?.next = ListNode(9)

dump(Solution().addTwoNumbers(l3, l4))

dump(Solution().addTwoNumbers(nil, nil))

let l5 = ListNode(1)
let l6 = ListNode(9)
l6.next = ListNode(9)

dump(Solution().addTwoNumbers(l5, l6))
