//
//  ViewController.swift
//  tips
//
//  Created by Niaz Jalal on 8/24/14.
//  Copyright (c) 2014 NS SQUARED SYSTEMS, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var tipPercentages = [0.15, 0.18, 0.2, 0.22, 0.25]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var defaults = NSUserDefaults.standardUserDefaults()
        var defaultTipPercentage = defaults.doubleForKey("default_percentage")
        
        for (index, value) in enumerate(tipPercentages) {
            
            if (value == defaultTipPercentage) {
                tipControl.selectedSegmentIndex = index
            }
        }
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }
}

