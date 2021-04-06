//
//  ViewController.swift
//  Tipsy
//
//  Created by Ilya on 05.04.2021.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipsAmount: Double = 0.1
    var resultValue: Double = 0.0
    var splitValue: Int = 2
    
    var tipsyBrain = TipsyBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //        splitNumberLabel.text = "1"
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        //        billTextField.endEditing(true)
        
        updateUI()
        sender.isSelected = true
        
        guard let tips = sender.currentTitle else { return }
        
        let tipsDouble = tipsyBrain.doubleTips(tips: tips)
        tipsAmount = tipsDouble / 100
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        splitValue = Int(sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let billValue = Double(billTextField.text ?? "0.0") else {
            return }
        
        resultValue = tipsyBrain.billValue(bill: billValue, tip: tipsAmount, split: splitValue)
        
        print(billValue, splitValue, tipsAmount)
        
        print(resultValue)
        
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }
    
    func updateUI() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            guard let destinationVC = segue.destination as? ResultsViewController else { return }
            destinationVC.resultValue = String(format: "%.2f", resultValue)
            destinationVC.peopleToSplit = splitValue
            destinationVC.tipValue = Int(tipsAmount * 100)
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    
    
}

