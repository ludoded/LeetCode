import UIKit

class Solution {
    func romanToInt(_ s: String) -> Int {
        var total = 0
        var i = 0

        let reversed = Array(s.reversed())
        while i < reversed.count {
            guard i < reversed.count else { return total }
            let next = i + 1
            switch reversed[i] {
            case "M":
                if next < reversed.count, reversed[next] == "C" {
                    total += 900
                    i += 1
                } else {
                    total += 1000
                }
            case "D":
                if next < reversed.count, reversed[next] == "C" {
                    total += 400
                    i += 1
                } else {
                    total += 500
                }
            case "C":
                if next < reversed.count, reversed[next] == "X" {
                    total += 90
                    i += 1
                } else {
                    total += 100
                }
            case "L":
                if next < reversed.count, reversed[next] == "X" {
                    total += 40
                    i += 1
                } else {
                    total += 50
                }
            case "X":
                if next < reversed.count, reversed[next] == "I" {
                    total += 9
                    i += 1
                } else {
                    total += 10
                }
            case "V":
                if next < reversed.count, reversed[next] == "I" {
                    total += 4
                    i += 1
                } else {
                    total += 5
                }
            case "I":
                total += 1
            default:
                break
            }
            i += 1
        }

        return total
    }
}

print(Solution().romanToInt("III"))
