//
//  calcmodel.swift
//  calculator
//
//  Created by Tair Sairanbekov on 01.02.2021.
//

import Foundation
func devision(op1:Double, op2:Double)->Double{
    return op1/op2
}
func multi(op1:Double, op2:Double)->Double{
    return op1*op2
}
func addition(op1:Double, op2:Double)->Double{
    return op1+op2
}
func difference(op1:Double, op2:Double)->Double{
    return op1-op2
}
func proc(op1:Double)->Double{
    return op1/100
}
func plusminus(op1:Double)->Double{
    return -1*op1
}
enum Operations{
    case constt(Double)
    case unaryOper((Double)->Double)
    case binaryOper((Double,Double)->Double)
    case equals
}
struct calculatorModel {
    private var glob: Double?
    private var saving: SaveFirstOperandAndOperation?
    var opers: Dictionary<String,Operations>=["÷":Operations.binaryOper(devision),
                                              "×":Operations.binaryOper(multi),
                                              "−":Operations.binaryOper(difference),
                                              "+":Operations.binaryOper(addition),
                                              "%":Operations.unaryOper(proc),
                                              "±":Operations.unaryOper(plusminus),
                                              "=":Operations.equals
    ]
    mutating func setOperand(_ operand: Double){
        glob=operand
    }
    mutating func performOperation(_ peration: String){
        let symbol = opers[peration]!
        switch symbol {
        case .constt(let value):
            glob=value
        case .unaryOper(let function): glob = function(glob!)
        case .binaryOper(let function):
            saving=SaveFirstOperandAndOperation(firstOperand: glob!, operation: function)
        case .equals:
            glob=saving?.performOperationWith(secondoperand: glob!)
        
        }
    }
    func getRes()-> Double?{
        
        return glob
    }
}
struct SaveFirstOperandAndOperation {
    var firstOperand: Double
    var operation: (Double, Double)->Double
    func performOperationWith(secondoperand op2:Double)->Double{
        return operation(firstOperand,op2)
    }
}

