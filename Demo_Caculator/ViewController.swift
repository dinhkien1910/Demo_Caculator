//
//  ViewController.swift
//  Demo_Caculator
//
//  Created by Nguyễn Đình Kiên on 19/07/2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var calculatorWorkings: UILabel!
    @IBOutlet weak var calculatorResults: UILabel!
    
    var workingSection = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
    }
    
    
    func clearAll()
    {
        workingSection = ""
        calculatorWorkings.text = ""
        calculatorResults.text = ""
    }
    
    
    
    @IBAction func equalsTap(_ sender: Any) {
        if(validInput()){
        let checkWorkingForPercent = workingSection.replacingOccurrences(of: "%", with: "*0.01")
        let expression = NSExpression(format: checkWorkingForPercent)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        
        let resultString = formatResult(result: result)
        calculatorResults.text = resultString
        
        }
        else{
            let alert = UIAlertController(
                title: "Invalid Input",
                message: "Calculator unable to do math base on input",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() -> Bool{
        var count = 0
        var funcCharIndexs = [Int]()
        for char in workingSection
        {
            if(specialCharacter(char: char)){
                funcCharIndexs.append(count)
            }
            count += 1
            
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexs {
            if(index == 0 || index == workingSection.count - 1){
                return false
            }
            if(index == workingSection.count - 1){
                return false
            }
            if(previous != -1)
            {
                if(index - previous == 1)
                {
                    return false
                }
            }
            previous = index
            
        }
        return true
        
    }
    
    func specialCharacter (char: Character)-> Bool
    {
        if(char == "*" || char == "/" || char == "-" || char == "+" || char == "="){
            return true
        }
        return false
    }
    
    
    
    func formatResult(result: Double) -> String  {
        if (result.truncatingRemainder(dividingBy: 1) == 0) {
            return String(format: "%.0f", result)
        }
        else{
            return String(format: "%.2f", result)
        }
    }
    
    
    @IBAction func allClearTap(_ sender: Any) {
        clearAll()
        
    }
    
    
    
    @IBAction func backTap(_ sender: Any) {
        if(!workingSection.isEmpty){
            workingSection.removeLast()
            calculatorWorkings.text = workingSection
        }
    }
    
    func addToWorking(value: String) {
        workingSection = workingSection + value
        calculatorWorkings.text = workingSection
    }
    
    
    @IBAction func percentTap(_ sender: Any) {
        addToWorking(value: "%")
    }
    
    @IBAction func divideTap(_ sender: Any) {
        addToWorking(value: "/")

    }
    
    
    @IBAction func multiplyTap(_ sender: Any) {
        addToWorking(value: "*")

    }
    
    
    @IBAction func minusTap(_ sender: Any) {
        addToWorking(value: "-")

    }
    @IBAction func plusTap(_ sender: Any) {
        addToWorking(value: "+")

    }
    
    
    @IBAction func decimalTap(_ sender: Any) {
        addToWorking(value: ",")

    }
    
    @IBAction func zeroTap(_ sender: Any) {
        addToWorking(value: "0")

    }
    
    
    
    @IBAction func oneTap(_ sender: Any) {
        addToWorking(value: "1")

    }
    
    
    @IBAction func twoTap(_ sender: Any) {
        addToWorking(value: "2")

    }
    
    
    @IBAction func threeTap(_ sender: Any) {
        addToWorking(value: "3")

    }
    
    @IBAction func fourTap(_ sender: Any) {
        addToWorking(value: "4")

    }
    
    
    @IBAction func fiveTap(_ sender: Any) {
        addToWorking(value: "5")

    }
    
    
    @IBAction func sixTap(_ sender: Any) {
        addToWorking(value: "6")

    }
    
    
    @IBAction func sevenTap(_ sender: Any) {
        addToWorking(value: "7")

    }
    
    @IBAction func eightTap(_ sender: Any) {
        addToWorking(value: "8")

    }
    
    
    @IBAction func nineTap(_ sender: Any) {
        addToWorking(value: "9")

    }
    
    
    
    
    
}

