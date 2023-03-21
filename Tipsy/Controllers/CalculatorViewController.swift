//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

  @IBOutlet weak var splitNumberPanel: UILabel!
  @IBOutlet weak var zeroPctButton: UIButton!
  @IBOutlet weak var tenPctButton: UIButton!
  @IBOutlet weak var twentyPctButton: UIButton!
  @IBOutlet weak var billTextField: UITextField!
  @IBOutlet weak var stepper: UIStepper!
  
  var tip = 0.10
  var numberOfPeople = 2
  var billTotal = 0.0
  var finalResult: String = ""
  
  override func viewDidLoad() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
    view.addGestureRecognizer(tap)
  }
  
  @IBAction func tipChanged(_ sender: UIButton) {
    billTextField.endEditing(true)
    
    zeroPctButton.isSelected = false
    tenPctButton.isSelected = false
    twentyPctButton.isSelected = false
    
    sender.isSelected = true
    
    let buttonTitle = sender.currentTitle!
    let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
    let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
    
    tip = buttonTitleAsANumber / 100
  }
  
  @IBAction func stepperValueChanged(_ sender: UIStepper) {
    billTextField.endEditing(true)
    splitNumberPanel.text = String(format: "%.0f", sender.value)
    numberOfPeople = Int(sender.value)
  }
  @IBAction func calculatePressed(_ sender: UIButton) {
    let bill = billTextField.text!
    if bill != "" {
      billTotal = Double(bill)!
      let result = billTotal * (1 + tip) / Double(numberOfPeople)
      let resultTo2DecimalPlaces = String(format: "%.2f", result)
      self.finalResult = resultTo2DecimalPlaces
      print(resultTo2DecimalPlaces)
      
      performSegue(withIdentifier: "goToResult", sender: self)
    }
    billTextField.text = ""
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "goToResult" {
      let destinationVC = segue.destination as! ResultsViewController
      destinationVC.result = self.finalResult
      destinationVC.numberOfPeople = self.numberOfPeople
      destinationVC.tipPercentage = self.tip * 100
    }
  }
  
  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
}

