//: Playground - noun: a place where people can play

var cc = CalculatorCore()

cc.execute(.Add(5))
cc.execute(.Multiplication(5))
cc.execute(.Minus(10))
cc.execute(.Clear)

print(cc.operations)

var c = Calculator()
c.push(9)
c.push(8)
c.push(7)
c.executeAdd()
print(c.core.value)

c.push(1)
c.push(0)
c.executeMinus()
print(c.core.value)

c.push(5)
c.push(0)
c.push(7)
c.pop()
c.executeAdd()
print(c.core.value)
c.push(7)
c.push(9)
c.executeFlush()
c.executeFlush()
c.executeFlush()
c.executeFlush()
print(c.core.value)

c.push(5)
c.markDecimal()
c.push(0)
c.push(8)
print(c.decimalPosition)
