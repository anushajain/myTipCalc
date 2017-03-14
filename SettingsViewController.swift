//
//  SettingsViewController.swift
//  MyTipCalc
//
//  Created by Anusha Jain on 3/12/17.
//  Copyright © 2017 anusha. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    
    @IBOutlet weak var tip1label: UILabel!
    @IBOutlet weak var tip2label: UILabel!
    @IBOutlet weak var tip3label: UILabel!
    @IBOutlet weak var tip1: UITextField!
    @IBOutlet weak var tip2: UITextField!
    @IBOutlet weak var tip3: UITextField!
    @IBOutlet weak var defaultSwitch: UISwitch!
    
    @IBOutlet weak var switchLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onOffSwitch(_ sender: Any) {
        let defaults = UserDefaults.standard
        let defaultsOn = defaults.object(forKey: "defaultsOn") as! Bool
        if defaultsOn {
            defaultSwitch.isOn = false
            defaults.set(false, forKey: "defaultsOn")
        } else {
            defaultSwitch.isOn = true
            defaults.set(true, forKey: "defaultsOn")
        }
        
        if defaultSwitch.isOn {
            tip1label.isHidden = false
            tip2label.isHidden = false
            tip3label.isHidden = false
            tip1.isHidden = false
            tip2.isHidden = false
            tip3.isHidden = false
            
            let defaults = UserDefaults.standard
            tip1.text = defaults.object(forKey: "tip1value") as? String
            tip2.text = defaults.object(forKey: "tip2value") as? String
            tip3.text = defaults.object(forKey: "tip3value") as? String
            
            
        } else {
            tip1label.isHidden = true
            tip2label.isHidden = true
            tip3label.isHidden = true
            tip1.isHidden = true
            tip2.isHidden = true
            tip3.isHidden = true
        }
        
    }

    @IBAction func changeTip1(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(tip1.text, forKey: "tip1value")
        defaults.synchronize()

    }
    
    @IBAction func changeTip2(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(tip2.text, forKey: "tip2value")
        defaults.synchronize()

    }
    
    @IBAction func changeTip3(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(tip3.text, forKey: "tip3value")
        defaults.synchronize()

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
