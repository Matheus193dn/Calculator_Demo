//
//  Results.swift
//  Calculator_Demo
//
//  Created by Matheus on 4/4/17.
//  Copyright © 2017 Matheus. All rights reserved.
//

import Foundation

enum operatorS{
    case plus
    case minus
    case multiply
    case divide
    case none
}

struct Results {
    let input: Float
    let input2: Float
    let output: Float
    let type: operatorS
    
    init(input: Int, input2: Int, type: operatorS) {
        let _input = Float(input)
        let _input2 = Float(input2)
        self.type = type
        self.input = _input
        self.input2 = _input2
        self.output = doMath(input: _input, input2: _input2, type: type)
    }
    
}

fileprivate func doMath(input: Float, input2: Float, type: operatorS) -> Float {
    switch type {
    case .plus:
        return (input + input2)
    case .minus:
        return (input - input2)
    case .multiply:
        return (input * input2)
    case .divide:
        return (input / input2)
    case .none:
        return 0
    }
}
