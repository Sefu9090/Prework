//
//  ViewController.swift
//  Prework
//
//  Created by Saul Fernandez on 12/29/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var peepStepper: UIStepper!
    @IBOutlet weak var perPerson: UILabel!
    @IBOutlet weak var numPeep: UILabel!
    @IBOutlet weak var prevBill: UILabel!
    @IBOutlet weak var prevTotal: UILabel!
    var tipPercentages = [0.15,0.18,0.2]
    let defaults = UserDefaults.standard
    var total = 0.00
    var bill = 0.00
    let moneySign = Locale.current.currencySymbol


    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        let percentNum1 = defaults.object(forKey: "percent1") as? Int
        let percentNum2 = defaults.object(forKey: "percent2") as? Int
        let percentNum3 = defaults.object(forKey: "percent3") as? Int
        tipControl.setTitle("\(percentNum1 ?? 15 )%", forSegmentAt: 0)
        tipControl.setTitle("\(percentNum2 ?? 18 )%", forSegmentAt: 1)
        tipControl.setTitle("\(percentNum3 ?? 20 )%", forSegmentAt: 2)
        tipPercentages[0] = Double(percentNum1 ?? 15) / 100
        tipPercentages[1] = Double(percentNum2 ?? 18) / 100
        tipPercentages[2] = Double(percentNum3 ?? 20) / 100
        billAmountTextField.becomeFirstResponder()
        let last1 = defaults.object(forKey: "pBill") as? Double ?? 0.00
        let last2 = defaults.object(forKey: "pTotal") as? Double ?? 0.00
        billAmountTextField.placeholder = moneySign
        tipPercentageLabel.text = moneySign! + "0.00"
        totalLabel.text = moneySign! + "0.00"
        perPerson.text = moneySign! + "0.00"
        prevBill.text = moneySign! + String(format: "%.2f", last1)
        prevTotal.text = moneySign! + String(format: "%.2f", last2)
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: Any) {
        prevBill.text = moneySign! + String(format: "%.2f", defaults.object(forKey: "pBill") as? Double ?? 0.00)
        prevTotal.text = moneySign! + String(format: "%.2f", defaults.object(forKey: "pTotal") as? Double ?? 0.00)
        bill = Double(billAmountTextField.text!) ?? 0
        let peeps = peepStepper.value
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        total  = bill + tip
        let amountPerPerson = total / peeps
        tipPercentageLabel.text = moneySign! + String(format: "%.2f", tip)
        totalLabel.text = moneySign! + String(format: "%.2f", total)
        perPerson.text = moneySign! + String(format: "%.2f", amountPerPerson)
        numPeep.text = String(format: "#%.0f", peeps)
        
        
    }
    @IBAction func updatePrev(_ sender: Any) {
        defaults.set(bill, forKey: "pBill")
        defaults.set(total, forKey: "pTotal")
        defaults.synchronize()
    }
}

