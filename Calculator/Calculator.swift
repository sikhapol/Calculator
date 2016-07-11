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
        if n >= radix {
            return
        }
        
        if baseNumber.count == 0 && n == 0 {
            return
        }
        
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
        case Add, Minus, Multiplication, Division, Set
    }
    
    private enum State {
        case Wait, Ready
    }
    
    public private(set) var core = CalculatorCore()
    
    private var buffer = NumberComponents()
    private var currentOperation = Operation.Set
    private var state = State.Ready
    
    public mutating func push(_ n: UInt) {
        if state == .Wait {
            clear()
        }
        buffer.push(n)
        state = .Ready
    }
    
    public mutating func pop() {
        if state == .Wait {
            clear()
        }
        buffer.pop()
        state = .Ready
    }
    
    public mutating func negate() {
        buffer.negate()
    }
    
    public mutating func markDecimal() {
        buffer.markDecimal()
    }
    
    public mutating func clear() {
        buffer = NumberComponents()
    }
    
    public mutating func execute(_ op: Operation) {
        
    }
    
    public init(radix: UInt = 10) {
        self.radix = radix
    }
}

public extension Calculator {
    public var debugDescription: String {
        return String(core.value, buffer, currentOperation)
    }
}
