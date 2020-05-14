/**
 Design a hit counter which counts the number of hits received in the past 5 minutes.

 Each function accepts a timestamp parameter (in seconds granularity) and you may assume that calls are being made to the system in chronological order (ie, the timestamp is monotonically increasing). You may assume that the earliest timestamp starts at 1.

 It is possible that several hits arrive roughly at the same time.

 Example:

 HitCounter counter = new HitCounter();

 // hit at timestamp 1.
 counter.hit(1);

 // hit at timestamp 2.
 counter.hit(2);

 // hit at timestamp 3.
 counter.hit(3);

 // get hits at timestamp 4, should return 3.
 counter.getHits(4);

 // hit at timestamp 300.
 counter.hit(300);

 // get hits at timestamp 300, should return 4.
 counter.getHits(300);

 // get hits at timestamp 301, should return 3.
 counter.getHits(301);
 Follow up:
 What if the number of hits per second could be very large? Does your design scale?


 */
class HitCounter {
    var dict: [Int: Int]
    var queue: [Int]
    var sum: Int
    
    /** Initialize your data structure here. */
    init() {
        self.dict = [:]
        self.queue = []
        self.sum = 0
    }
    
    /** Record a hit.
        @param timestamp - The current timestamp (in seconds granularity). */
    func hit(_ timestamp: Int) {
        if dict.keys.contains(timestamp) {
            dict[timestamp] = dict[timestamp]! + 1
        } else {
            dict[timestamp] = 1
        }
        
        queue.append(timestamp)
        sum += 1
    }
    
    /** Return the number of hits in the past 5 minutes.
        @param timestamp - The current timestamp (in seconds granularity). */
    func getHits(_ timestamp: Int) -> Int {
        while !queue.isEmpty && (timestamp - queue.first!) >= 300 {
            let t = queue.removeFirst()
            let sec = dict.removeValue(forKey: t) ?? 0
            sum -= sec
        }
        
        return sum
    }
}

/**
 * Your HitCounter object will be instantiated and called as such:
 * let obj = HitCounter()
 * obj.hit(timestamp)
 * let ret_2: Int = obj.getHits(timestamp)
 */

let c = HitCounter()
c.hit(1)
c.hit(2)
c.hit(3)
c.getHits(4) // 3
c.hit(300)
c.getHits(300) // 4
c.getHits(301) // 3
