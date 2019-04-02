//
//  ViewController.swift
//  TwoNumberAdd
//
//  Created by tangyunchuan on 2019/2/15.
//  Copyright © 2019 yqs. All rights reserved.
//

import UIKit
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int, next:ListNode?) {
        self.val = val
        self.next = next
    }
}
class ViewController: UIViewController {
    var head : ListNode?
    var head1 : ListNode?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let array = [2, 4, 3];
        let array1 = [5, 6, 4];
        let targe = 9;
        
        
        print(twoSum(array, targe))
        
       head = ListNode.init(0, next: nil);
       head1 = ListNode.init(0, next: nil);
        for i in array {
            addNode(node: ListNode.init(i, next: nil))
            
        }
        for i in array1 {
            addNode(node: ListNode.init(i, next: nil))
            
        }
        print(head ?? "")
        
        
       let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100));
        button.addTarget(self, action: #selector(clickButton), for: UIControlEvents.touchUpInside)
        button.backgroundColor = UIColor.red;
        self.view.addSubview(button)
    }
    @objc func clickButton()  {
        let array1 = [0,0,0]
        print(threeSum(array1))
        
        
    }
    func addNode(node:ListNode)->Bool{
        var p  = head?.next
        var q:ListNode! = head
        while (p != nil) {
            q = p
            p = p!.next
            
        }
        
        q.next = node
        
        print(head?.next )
        print(q.next )
        return true
        
    }

    ///两数求和
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var i = 0
        while i < nums.count-1 {
            for j in i+1...nums.count-1 {
                if (nums[i] + nums[j] == target){
                    return [i,j];
                }
            }
            i += 1
        }
        return []
    }
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var haha : [[Int]] = []
        if nums.count < 3 {
            return haha
        }
        var MutNums : [Int] = nums
        
        MutNums.sort()
        for i in 0...MutNums.count-3 {
            if MutNums[i] > 0 {
                break;
            }
            if i > 0 && MutNums[i] == MutNums[i-1] {
                continue
            }
            var j = i + 1;
            var k = MutNums.count - 1
            while j < k {
                let num = -(MutNums[j] + MutNums[k])
                if MutNums[i] == num {
                    haha.append([MutNums[i],MutNums[j],MutNums[k]])
                    j += 1
                    k -= 1
                    while MutNums[j] == MutNums[j-1] && j < k{
                        j += 1
                    }
                    while MutNums[k] == MutNums[k+1] && k > j{
                        k -= 1
                    }
                }else if MutNums[i] > num{

                    k -= 1
                }else if MutNums[i] < num{
                    j += 1
                }

            }


        }
        return haha;
    }
    //    func threeSum(_ nums: [Int]) -> [[Int]] {
    //        var MutNums: [Int] = nums
    //        var haha:[[Int]] = []
    //        // 1.排序 对于MutNums[i]来说，我们只需要负数和0，因为三个数之和为0，一定是有一个数为负数的，当然除去三个数都为0的情况。所以，我们取非正数。
    //        MutNums.sort()
    //        for i in 0..<MutNums.count {
    //            if (MutNums[i] > 0) {
    //                break;
    //            }
    //            // 如果两个数字相同，我们直接跳到下一个循环。
    //            if (i > 0 && MutNums[i] == MutNums[i-1]) {
    //                continue
    //            }
    //            let target = 0 - MutNums[i];
    //            var j = i+1, k = MutNums.count - 1
    //            while j < k {
    //                // 2.找到后面的两个与MutNums[i]对应的数字
    //                if (MutNums[j] + MutNums[k] == target) {
    //                    haha.append([MutNums[i],MutNums[j],MutNums[k]])
    //                    // 如果两个数字相同，我们直接跳到下一个循环。
    //                    while j < k && MutNums[j] == MutNums[j+1] {
    //                        j = j + 1
    //                    }
    //                    // 如果两个数字相同，我们直接跳到下一个循环。
    //                    while j < k && MutNums[k] == MutNums[k-1] {
    //                        k = k - 1
    //                    }
    //                    // 否则就往中间靠拢
    //                    j = j + 1;k = k - 1
    //                }else if (MutNums[j] + MutNums[k] < target) {
    //                    // 如果后面两数相加小于target，说明左边还得往右移
    //                    j = j + 1
    //                }else {
    //                    // 如果后面两数相加大于target，说明右边就要往左移
    //                    k = k - 1
    //                }
    //            }
    //        }
    //        return haha
    //    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

