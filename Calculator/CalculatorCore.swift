//
//  CalculatorCore.swift
//  Calculator
//
//  Created by Sikhapol Saijit on 7/7/16.
//  Copyright © 2016 Sikhapol Saijit. All rights reserved.
//

public enum Operation {
    case Add(Double)
    case Minus(Double)
    case Multiplication(Double)
    case Division(Double)
    case Set(Double)
    case Clear
}

public struct CalculatorCore {
    public private(set) var value: Double = 0
    public private(set) var operations = [Operation]()
    
    public init() { }
    
    public mutating func execute(_ op: Operation) -> Double {
        switch op {
        case let .Add(operand):
            value += operand
        case let .Minus(operand):
            value -= operand
        case let .Multiplication(operand):
            value *= operand
        case let .Division(operand):
            value *= operand
        case let .Set(operand):
            value = operand
        case .Clear:
            value = 0
        }
        operations.append(op)
        return value
    }
}
