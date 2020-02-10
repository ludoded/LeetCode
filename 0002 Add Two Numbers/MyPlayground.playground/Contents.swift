import UIKit

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
        if let l1 = l1, let l2 = l2 {
            print(l1.val)
            print(l2.val)
        }
        return nil
    }
}


let s11 = ListNode(5)
let s12 = ListNode(4)
let s13 = ListNode(3)
s11.next = s12
s12.next = s13

let s21 = ListNode(6)
let s22 = ListNode(6)
let s23 = ListNode(4)
s21.next = s22
s22.next = s23

dump(Solution().addTwoNumbers(s11, s21))
