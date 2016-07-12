//
//  CalculatorCore.swift
//  Calculator
//
//  Created by Sikhapol Saijit on 7/7/16.
//  Copyright © 2016 Sikhapol Saijit. All rights reserved.
//

public protocol Operation {
    func execute(operand: Double) -> Double
}

public struct CalculatorCore {
    public private(set) var value: Double = 0
    public private(set) var operations = [Operation]()
    
    public init() { }
    
    public mutating func execute(_ op: Operation) -> Double {
        value = op.execute(operand: value)
        operations.append(op)
        return value
    }
}

public protocol BinaryOperation: Operation {
    var secondOperand: Double { get }
    init(_ secondOperand: Double)
}

public struct Add: BinaryOperation {
    public let secondOperand: Double
    
    public init(_ secondOperand: Double) {
        self.secondOperand = secondOperand
    }
    
    public func execute(operand: Double) -> Double {
        return operand + secondOperand
    }
}

public struct Minus: BinaryOperation {
    public let secondOperand: Double
    
    public init(_ secondOperand: Double) {
        self.secondOperand = secondOperand
    }
    
    public func execute(operand: Double) -> Double {
        return operand - secondOperand
    }
}

public struct Multiply: BinaryOperation {
    public let secondOperand: Double
    
    public init(_ secondOperand: Double) {
        self.secondOperand = secondOperand
    }
    
    public func execute(operand: Double) -> Double {
        return operand * secondOperand
    }
}

public struct Divide: BinaryOperation {
    public let secondOperand: Double
    
    public init(_ secondOperand: Double) {
        self.secondOperand = secondOperand
    }
    
    public func execute(operand: Double) -> Double {
        return operand / secondOperand
    }
}

public struct Set: Operation {
    public let value: Double
    
    public init(_ value: Double) {
        self.value = value
    }
    
    public func execute(operand: Double) -> Double {
        return value
    }
}

public struct Clear: Operation {
    public func execute(operand: Double) -> Double {
        return 0
    }
}
