//
//  ViewController.swift
//  IntroToiOS
//
//  Created by Sesili Tsikaridze on 21.10.23.
//

import UIKit


// iPhone 14 - ზე ავაწყვე მარა რაღაც ქონსთრეინთები ადევს და წესით ყველაზე გაეშვება

class ViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var switchOutlet: UISwitch!
    
    @IBOutlet weak var firstNumber: UITextField!
    @IBOutlet weak var secondNumber: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBActions
    
    @IBAction func calculateButton(_ sender: UIButton) {
        
        firstNumber.layer.borderWidth = 0
        secondNumber.layer.borderWidth = 0
        
        if let text1 = firstNumber.text, let text2 = secondNumber.text,
           let number1 = Int(text1), let number2 = Int(text2) {
            if switchOutlet.isOn {
                let gcd = calculateGCD(number1: number1, number2: number2)
                resultLabel.text = "უდიდესი საერთო გამყოფი არის: \(gcd)"
            } else {
                let lcm = calculateLCM(number1: number1, number2: number2)
                resultLabel.text = "უმცირესი საერთო ჯერადი არის: \(lcm)"
            }
        } else {
            textFieldBorder(firstNumber)
            textFieldBorder(secondNumber)
            resultLabel.text = "გთხოვთ შეიყვანოთ მთელი რიცხვები"
        }
        
        //ამის გარეშე კლავიატურა არ ქრებოდა ღილაკზე დაჭერისას
        firstNumber.endEditing(true)
        secondNumber.endEditing(true)
        
    }
    
    
    @IBAction func switchAction(_ sender: UISwitch) {
        if switchOutlet.isOn {
            switchLabel.text = "უდიდესი საერთო გამყოფი"
        } else {
            switchLabel.text = "უმცირესი საერთო ჯერადი"
        }
    }
    
    //MARK: - Functions
    
    func calculateGCD(number1: Int, number2: Int) -> Int {
        var firstDividers: Set<Int> = []
        
        for i in 1...number1 {
            if number1 % i == 0 {
                firstDividers.insert(i)
            }
        }
        
        var secondDividers: Set<Int> = []
        
        
        for i in 1...number2 {
            if number2 % i == 0 {
                secondDividers.insert(i)
            }
        }
        
        let sortedSet = firstDividers.intersection(secondDividers).sorted()
        
        return sortedSet[sortedSet.count - 1]
        
    }
    
    func calculateLCM(number1: Int, number2: Int) -> Int {
        let gcd = calculateGCD(number1: number1, number2: number2)
        let lcm = number1 * number2 / gcd
        return lcm
    }
    
    func textFieldBorder(_ textField: UITextField) {
        if ((Int(textField.text ?? "")) == nil) {
            textField.layer.borderWidth = 1
            textField.layer.cornerRadius = 5
            textField.layer.borderColor = UIColor.red.cgColor
        }
    }
    
}
