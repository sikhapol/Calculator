//
//  Calculator.swift
//  Calculator
//
//  Created by Sikhapol Saijit on 7/6/16.
//  Copyright © 2016 Sikhapol Saijit. All rights reserved.
//

import Foundation

public struct NumberComponents {
    public enum Sign {
        case Positive, Negative
    }
    
    public var radix: UInt = 10
    public var baseNumber = [UInt]()
    public var sign = Sign.Positive
    public var decimalPosition: UInt? = nil
}

public extension NumberComponents {
    public mutating func negate() {
        switch sign {
        case .Positive:
            sign = .Negative
        case .Negative:
            sign = .Positive
        }
    }
    
    public var intValue: Int {
        return Int(doubleValue)
    }
    
    public var doubleValue: Double {
        var value: Double = 0
        for n in baseNumber {
            value *= Double(radix)
            value += Double(n)
        }
        if let decimalPosition = decimalPosition {
            for _ in 0..<decimalPosition {
                value /= Double(radix)
            }
        }
        return value
    }
}

let maxWidth = 20
extension NumberComponents {
    public mutating func push(_ n: UInt) {
        if baseNumber.count >= maxWidth {
            return
        }
        
        baseNumber.append(n)
        
        if let position = decimalPosition {
            decimalPosition = position + 1
        }
    }
    
    public mutating func pop() {
        if baseNumber.count <= 0 {
            return
        }
        
        _ = baseNumber.popLast()
        
        if let position = decimalPosition {
            switch position {
            case 0, 1:
                decimalPosition = nil
            default:
                decimalPosition = position - 1
            }
        }
    }
    
    public mutating func markDecimal() {
        if decimalPosition == nil {
            decimalPosition = 0
        }
    }
}

public struct Calculator {
    let radix: UInt
    
    public enum Operation {
        case Add, Minus, Multiplication, Division, Set, Flush
    }
    
    public private(set) var buffer: NumberComponents?
    public private(set) var core = CalculatorCore()
    
    var lastOperation = Operation.Set
    
    public mutating func push(_ n: UInt) {
        buffer = buffer ?? NumberComponents()
        buffer?.push(n)
    }
    
    public mutating func pop() {
        buffer = buffer ?? NumberComponents()
        buffer?.pop()
    }
    
    public mutating func negate() {
        buffer = buffer ?? NumberComponents()
        buffer?.negate()
    }
    
    public mutating func markDecimal() {
        buffer = buffer ?? NumberComponents()
        buffer?.markDecimal()
    }
    
    public mutating func execute(_ op: Operation) {
        let operand: Double
        if let buffer = buffer {
            operand = buffer.doubleValue
        } else {
            operand = 0
        }
        
        switch lastOperation {
        case .Add:
            _ = core.execute(.Add(operand))
        case .Minus:
            _ = core.execute(.Minus(operand))
        case .Multiplication:
            _ = core.execute(.Multiplication(operand))
        case .Division:
            _ = core.execute(.Division(operand))
        case .Set:
            _ = core.execute(.Set(operand))
        case .Flush:
            break
        }
        
        buffer = nil
        lastOperation = op
    }
    
    public init(radix: UInt = 10) {
        self.radix = radix
    }
}
