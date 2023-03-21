//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by VegaPunk on 21/03/2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
  
  var result: String = ""
  var numberOfPeople: Int = 0
  var tipPercentage: Double = 0.0
  
  @IBOutlet weak var settingsLabel: UILabel!
  @IBOutlet weak var totalLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    settingsLabel.text = "Split between \(numberOfPeople) people, with \(tipPercentage)% tip."
    totalLabel.text = result
  }
  
  
  @IBAction func recalculatePressed(_ sender: UIButton) {
    self.dismiss(animated: true)
  }
  
  
}
