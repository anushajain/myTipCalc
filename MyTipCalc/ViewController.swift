//
//  ViewController.swift
//  MyTipCalc
//
//  Created by Anusha Jain on 3/8/17.
//  Copyright © 2017 anusha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipOption: UISegmentedControl!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let defaults = UserDefaults.standard
        if defaults.object(forKey: "tip1value") == nil {
            defaults.set("18", forKey: "tip1value")
        }
        if defaults.object(forKey: "tip2value") == nil {
            defaults.set("20", forKey: "tip2value")
        }
        if defaults.object(forKey: "tip3value") == nil {
            defaults.set("25", forKey: "tip3value")
        }
        if defaults.object(forKey: "defaultsOn") == nil {
            defaults.set(true, forKey: "defaultsOn")
        }
        defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [tipOption.titleForSegment(at: 0)! as String, tipOption.titleForSegment(at: 1)! as String, tipOption.titleForSegment(at: 2)! as String]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * Double(tipPercentages[tipOption.selectedSegmentIndex])! / 100
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let tip1 = defaults.object(forKey: "tip1value") as! String
        tipOption.setTitle(tip1, forSegmentAt: 0)
        let tip2 = defaults.object(forKey: "tip2value") as! String
        tipOption.setTitle(tip2, forSegmentAt: 1)
        let tip3 = defaults.object(forKey: "tip3value") as! String
        tipOption.setTitle(tip3, forSegmentAt: 2)
    }
    
    
    
}

