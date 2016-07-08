//
//  Calculator.swift
//  Calculator
//
//  Created by Sikhapol Saijit on 7/6/16.
//  Copyright © 2016 Sikhapol Saijit. All rights reserved.
//

import Foundation

public struct Calculator {
    let max = 1000000000000
    public enum DecimalPosition {
        case None, Set(position: Int)
    }
    
    public enum Operation {
        case Add, Minus, Multiplication, Division, Set, Flush
    }
    
    public var buffer: Int = 0
    public var decimalPosition = DecimalPosition.None
    var lastOperation = Operation.Set
    var lastNonFlushOperation = Operation.Set
    var lastNonFlushOperand: Double?
    public var core = CalculatorCore()
    var isInitial = true
    
    public mutating func push(_ n: Int) {
        if abs(buffer) >= max {
            return
        }
        buffer = buffer * 10 + n
        if case let .Set(p) = decimalPosition {
            decimalPosition = .Set(position: p+1)
        }
        isInitial = false
    }
    
    public mutating func pop() {
        buffer /= 10
        if case let .Set(p) = decimalPosition {
            if p == 0 || p == 1 {
                decimalPosition = .None
            } else {
                decimalPosition = .Set(position: p-1)
            }
        }
        isInitial = false
    }
    
    public mutating func negate() {
        buffer *= -1
        isInitial = false
    }
    
    public mutating func clear() {
        buffer = 0
        decimalPosition = .None
        isInitial = false
    }
    
    mutating func execute(_ op: Operation) {
        var operand = Double(buffer)
        if case let .Set(n) = decimalPosition {
            operand /= Double(pow(10, n))
        }
        
        var executingOperation = lastOperation
        
        if let opnd = lastNonFlushOperand where op == .Flush && isInitial {
            operand = opnd
            executingOperation = lastNonFlushOperation
        }
        
        switch executingOperation {
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
        
        if op != .Flush {
            lastNonFlushOperation = op
            lastNonFlushOperand = operand
        }
        
        lastOperation = op
        decimalPosition = .None
        self.buffer = 0
        
        isInitial = true
    }
    
    public mutating func markDecimal() {
        if case .None = decimalPosition {
            decimalPosition = .Set(position: 0)
        }
        isInitial = false
    }
    
    public init() {
        
    }
}
