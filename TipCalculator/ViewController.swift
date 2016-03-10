//
//  ViewController.swift
//  TipCalculator
//
//  Created by Corona, Danny on 3/9/16.
//  Copyright © 2016 Corona, Danny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var finalAmountLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var ratingValue : Int = 1
    var amountValue : String?
    
    func tip(num : Float) -> Float
    {
        if ratingValue == 1 || ratingValue == 2 || ratingValue == 3
        {
            tipAmountLabel.text! = "Tip = 10%"
            return 0.10
        }
        
        if ratingValue == 4 || ratingValue == 5
        {
            tipAmountLabel.text! = "Tip = 13%"
            return 0.13
        }
        
        if ratingValue == 6 || ratingValue == 7
        {
            tipAmountLabel.text! = "Tip = 15%"
            return 0.15
        }
        
        if ratingValue == 8 || ratingValue == 9
        {
            tipAmountLabel.text! = "Tip = 20%"
            return 0.20
        }
        
        if ratingValue == 10
        {
            tipAmountLabel.text! = "Tip = 25%"
            return 0.25
        }
        
        return 0.10
    }

    @IBAction func stepperClicked(sender: AnyObject) {
        
        ratingValue = Int(stepper.value)
        self.ratingLabel.text! = "\(ratingValue)"
        
    }
    @IBAction func calcButton(sender: AnyObject) {
        
        let amt : Float? = Float(self.amountTextField.text!)
        
        if amt == nil
        {
            self.tipAmountLabel.text! = ""
            self.finalAmountLabel.text! = "Please enter a number"
        }
            
        if amt < 0 || amt == -0
        {
            self.tipAmountLabel.text! = ""
            self.finalAmountLabel.text! = "Not a positive number"
        }
        
        else
        {
            self.amountTextField.text! = String(format: "%.2f", amt!)
            
            let finalAmt = amt! + (amt! * tip(amt!))
            self.finalAmountLabel.text! = String(format: "Total amount = $%.2f", finalAmt)
        }
        
    }
}

