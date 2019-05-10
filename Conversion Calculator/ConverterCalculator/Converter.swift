//
//  Converter.swift
//  ConversionCalculator
//
//  Created by Clubb, Daniel J. (MU-Student) on 4/12/19.
//  Copyright © 2019 Clubb, Daniel J. (MU-Student). All rights reserved.
//

import Foundation

struct Converter
{
    let label: String
    let inputUnit: String
    let outputUnit: String
    
    init(label: String, inputUnit: String, outputUnit: String)
    {
        self.label = label
        self.inputUnit = inputUnit
        self.outputUnit = outputUnit
    }
}
