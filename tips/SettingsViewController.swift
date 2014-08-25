//
//  SettingsViewController.swift
//  tips
//
//  Created by Niaz Jalal on 8/24/14.
//  Copyright (c) 2014 NS SQUARED SYSTEMS, LLC. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultTipControl: UISegmentedControl!
    
    /* NAJ: The default percentage only works for reloading the the app and when returning to the settings view. Going from settings back to main view does not change the percentage. This is the expected behaviour.
    */
    var defaultTipPercentages = [0.15, 0.18, 0.2, 0.22, 0.25]
    var defaultTipPercentage = 0.00
    var setTipPercentage = false
    var defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if (setTipPercentage) {
            
            defaultTipPercentage = defaultTipPercentages[defaultTipControl.selectedSegmentIndex]
        } else {
            
            defaultTipPercentage = defaults.doubleForKey("default_percentage")
            
            for (index, value) in enumerate(defaultTipPercentages) {
                
                if (value == defaultTipPercentage) {
                    
                    defaultTipControl.selectedSegmentIndex = index
                }
            }
            
            setTipPercentage = true
        }
        
        defaults.setDouble(defaultTipPercentage, forKey: "default_percentage")
        defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func defaultPercentageChanged(sender: AnyObject) {
        
        var percentage = defaultTipPercentages[defaultTipControl.selectedSegmentIndex]
        
        defaults.setDouble(percentage, forKey: "default_percentage")
        defaults.synchronize()
    }
}
