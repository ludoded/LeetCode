/**
 Convert a non-negative integer to its english words representation. Given input is guaranteed to be less than 231 - 1.

 Example 1:

 Input: 123
 Output: "One Hundred Twenty Three"
 Example 2:

 Input: 12345
 Output: "Twelve Thousand Three Hundred Forty Five"
 Example 3:

 Input: 1234567
 Output: "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"
 Example 4:

 Input: 1234567891
 Output: "One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One"

 */

class Solution {
    private lazy var dict: [Int: String] = {
        return [
            0: "Zero",
            1: "One",
            2: "Two",
            3: "Three",
            4: "Four",
            5: "Five",
            6: "Six",
            7: "Seven",
            8: "Eight",
            9: "Nine",
            10: "Ten",
            11: "Eleven",
            12: "Twelve",
            13: "Thirteen",
            14: "Fourteen",
            15: "Fifteen",
            16: "Sixteen",
            17: "Seventeen",
            18: "Eighteen",
            19: "Nineteen",
            20: "Twenty",
            30: "Thirty",
            40: "Forty",
            50: "Fifty",
            60: "Sixty",
            70: "Seventy",
            80: "Eighty",
            90: "Ninety",
            100: "Hundred",
            1_000: "Thousand",
            1_000_000: "Million",
            1_000_000_000: "Billion",
            1_000_000_000_000: "Trillion"
        ]
    }()
    
    private func convertHundreds(_ num: Int) -> [String] {
        var res: [String] = []
        let hundreds = num % 1000
        let hundred = hundreds / 100
        if hundred > 0 {
            res.append(dict[hundred]!)
            res.append(dict[100]!)
        }
        
        let tens = hundreds % 100
        if tens < 20 && tens > 0 {
            res.append(dict[tens]!)
        } else if tens > 0 {
            let ten = tens / 10 * 10
            res.append(dict[ten]!)
            let ones = tens % 10
            if ones > 0 {
                res.append(dict[ones]!)
            }
        }
        
        return res
    }
    
    func numberToWords(_ num: Int) -> String {
        if num == 0 { return dict[0]! }
        
        var res: [String] = []
        
        /// Trillion
        let trillion = 1_000_000_000_000
        let trillions = num / trillion
        if trillions > 0 {
            let amount = dict[trillions]!
            let trillStr = dict[trillion]!
            res.append(amount)
            res.append(trillStr)
        }
        
        /// Billion
        let billion = 1_000_000_000
        let billions = num / billion
        if billions > 0 {
            let billHunds = convertHundreds(billions)
            if !billHunds.isEmpty {
                res.append(contentsOf: billHunds)
                res.append(dict[billion]!)
            }
        }
        
        /// Million
        let million = 1_000_000
        let millions = num / million
        if millions > 0 {
            let millHunds = convertHundreds(millions)
            if !millHunds.isEmpty {
                res.append(contentsOf: millHunds)
                res.append(dict[million]!)
            }
        }
        
        /// Thousands
        let thousand = 1_000
        let thousands = num / thousand
        if thousands > 0 {
            let thHunds = convertHundreds(thousands)
            if !thHunds.isEmpty {
                res.append(contentsOf: thHunds)
                res.append(dict[thousand]!)
            }
        }
        
        let hunds = convertHundreds(num)
        res.append(contentsOf: hunds)
        
        return res.joined(separator: " ")
    }
}

//print(2837647999 % 1000)
//print(2837647999 % 100)
print(Solution().numberToWords(11_121_212_454_432))
print(Solution().numberToWords(0))
print(Solution().numberToWords(1_111_111))
print(Solution().numberToWords(1_000_000_001))
