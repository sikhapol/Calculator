//
//  ViewController.swift
//  Calculator
//
//  Created by Sikhapol Saijit on 7/6/16.
//  Copyright © 2016 Sikhapol Saijit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    @IBOutlet var num: [UIButton]!
//    @IBOutlet weak var label: UILabel!
//    
//    var formatter1: NumberFormatter = {
//        var f = NumberFormatter()
//        f.numberStyle = .decimal
//        f.maximumFractionDigits = 0
//        return f
//    }()
//    var formatter2: NumberFormatter = {
//        var f = NumberFormatter()
//        f.numberStyle = .decimal
//        return f
//    }()
//    var formatter3: NumberFormatter = {
//        var f = NumberFormatter()
//        f.paddingCharacter = "0"
//        return f
//    }()
//    var cal = Calculator()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    @IBAction func numTouch(_ sender: UIButton) {
//        if let i = num.index(of: sender) {
//            cal.push(i)
//            displayBuffer()
//        }
//        
//    }
//    
//    func displayBuffer() {
//        if case let .Set(n) = cal.decimalPosition {
//            if n == 0 {
//                label.text = formatter1.string(from: cal.buffer)! + formatter1.decimalSeparator + " "
//            } else {
//                let i = Int(pow(10, n))
//                formatter3.formatWidth = n
//                let s = "\(formatter1.string(from: cal.buffer / i)!)\(formatter1.decimalSeparator!)\(formatter3.string(from: cal.buffer % i)!) "
//                label.text = s
//            }
//        } else {
//            label.text = formatter1.string(from: cal.buffer)! + " "
//        }
//        
//    }
//    
//    func displayCore() {
//        let label = self.label!
//        label.text = formatter2.string(from: cal.core.value)! + " "
//        label.alpha = 0
//        _ = UIViewPropertyAnimator(duration: 0.1, curve: .easeInOut) {
//            label.alpha = 1
//        }.startAnimation()
//        
//        
//    }
//    
//    @IBAction func clear(_ sender: AnyObject) {
//        cal.clear()
//        displayBuffer()
//    }
//    
//    @IBAction func markDecimal(_ sender: AnyObject) {
//        cal.markDecimal()
//        displayBuffer()
//    }
//    
//    @IBAction func flush(_ sender: AnyObject) {
//        cal.execute(.Flush)
//        displayCore()
//    }
//    
//    @IBAction func pop(_ sender: AnyObject) {
//        cal.pop()
//        displayBuffer()
//    }
//    
//    @IBAction func plus(_ sender: AnyObject) {
//        cal.execute(.Add)
//        displayCore()
//    }
//    
//    @IBAction func minus(_ sender: AnyObject) {
//        cal.execute(.Minus)
//        displayCore()
//    }
//    
//    @IBAction func mult(_ sender: AnyObject) {
//        cal.execute(.Multiplication)
//        displayCore()
//    }
//    
//    @IBAction func divide(_ sender: AnyObject) {
//        cal.execute(.Division)
//        displayCore()
//    }
//    
//    @IBAction func negate(_ sender: AnyObject) {
//        cal.negate()
//        displayBuffer()
//    }
    
}

