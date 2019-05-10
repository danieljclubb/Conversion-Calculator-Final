//
//  ConverterViewController.swift
//  ConverterCalculator
//
//  Created by Clubb, Daniel J. (MU-Student) on 4/12/19.
//  Copyright © 2019 Clubb, Daniel J. (MU-Student). All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController
{
    @IBOutlet weak var outputDisplay: UITextField!
    @IBOutlet weak var inputDisplay: UITextField!
    
    var converterChoice = 0
    var outputString: String = ""
    var inputString: String = ""
    var outputDouble: Double = 0
    var inputDouble: Double? = 0
    var button = ""
    var converters: [Converter] =
    [
            Converter(label: "farenheit to celcius", inputUnit: "°F", outputUnit: "°C"),
            Converter(label: "celcius to farenheit", inputUnit: "°C", outputUnit: "°F"),
            Converter(label: "miles to kilometers", inputUnit: "mi", outputUnit: "km"),
            Converter(label: "kilometers to miles", inputUnit: "km", outputUnit: "mi")
    ]
    var con: Converter!
    var hasDecimal: Bool = false
    
    func changeConverter(to converter: Converter)
    {
        outputDisplay.text = converter.outputUnit
        inputDisplay.text = converter.inputUnit
    }
    
    @IBAction func converterTap(_ sender: Any){
        let alert = UIAlertController(title: "Choose Converter", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        alert.addAction(UIAlertAction(title: converters[0].label, style: .default, handler: {(alertAction)in
            self.con = self.converters[0]
            self.changeConverter(to: self.con)
            self.converterChoice = 0
            self.clear()
        }))
        alert.addAction(UIAlertAction(title: converters[1].label, style: .default, handler: {(alertAction)in
            self.con = self.converters[1]
            self.changeConverter(to: self.con)
            self.converterChoice = 1
            self.clear()
        }))
        alert.addAction(UIAlertAction(title: converters[2].label, style: .default, handler: {(alertAction)in
            self.con = self.converters[2]
            self.changeConverter(to: self.con)
            self.converterChoice = 2
            self.clear()
        }))
        alert.addAction(UIAlertAction(title: converters[3].label, style: .default, handler: {(alertAction)in
            self.con = self.converters[3]
            self.changeConverter(to: self.con)
            self.converterChoice = 3
            self.clear()
        }))
        self.present(alert, animated: true, completion: nil)
    }
        
    func clear(){
        outputString = ""
        inputString = ""
        outputDouble = 0
        inputDouble = 0
        hasDecimal = false
        inputDisplay.text = inputString + converters[converterChoice].inputUnit
        outputDisplay.text = outputString + converters[converterChoice].outputUnit
    }
    
    @IBAction func clearPress(_sender: UIButton){
        self.clear()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        changeConverter(to: converters[0])
    }
    
    @IBAction func buttonPress(_ sender: UIButton){
        button = String(sender.tag)
        inputString = inputString + button
        inputDisplay.text = inputString + converters[converterChoice].inputUnit
        inputDouble = Double(inputString)
        outputString = performConversion(inputDouble: inputDouble ?? 0)
        outputDisplay.text = outputString + converters[converterChoice].outputUnit
    }

    @IBAction func decimalPress(_sender: UIButton){
        if(hasDecimal == false){
            inputString = inputString + "."
            inputDisplay.text = inputString + converters[converterChoice].inputUnit
            self.hasDecimal = true
            inputDouble = Double(inputString)
            outputString = performConversion(inputDouble: inputDouble ?? 0)
            outputDisplay.text = outputString + converters[converterChoice].outputUnit
        }
    }
    
    @IBAction func signPress(_sender: UIButton){
        if inputString.prefix(1) == "-"{
            inputString = String(inputString.dropFirst())
            inputDouble = Double(inputString)
            outputString = performConversion(inputDouble: inputDouble ?? 0)
            outputDisplay.text = outputString + converters[converterChoice].outputUnit
        }
        else{
            inputString = "-" + inputString
            inputDouble = Double(inputString)
            outputString = performConversion(inputDouble: inputDouble ?? 0)
            outputDisplay.text = outputString + converters[converterChoice].outputUnit
        }
        inputDisplay.text = inputString + converters[converterChoice].inputUnit
    }
    
    func performConversion(inputDouble: Double) -> String{
        switch converterChoice{
        case 0: outputDouble = (inputDouble - 32) * (5/9)
            return String(Double(round(1000*outputDouble)/1000))
        case 1: outputDouble = ((inputDouble * (5/9)) + 32)
            return String(Double(round(1000*outputDouble)/1000))
        case 2: outputDouble = inputDouble * 1.60934
            return String(Double(round(1000*outputDouble)/1000))
        case 3: outputDouble = inputDouble / 1.60934
            return String(Double(round(1000*outputDouble)/1000))
        default:
            return "oops"
        }
    }

}

