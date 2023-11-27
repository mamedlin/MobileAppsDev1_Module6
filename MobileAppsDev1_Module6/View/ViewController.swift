//
//  ViewController.swift
//  MobileAppsDev1_Module6
//
//  Created by Michael Medlin on 11/26/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var usdTextField: UITextField!
    
    @IBOutlet weak var eurSwitch: UISwitch!
    @IBOutlet weak var gbpSwitch: UISwitch!
    @IBOutlet weak var jpySwitch: UISwitch!
    @IBOutlet weak var cadSwitch: UISwitch!
    
    var convertLogic = ConvertLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Hide the error label to begin with
        errorLabel.isHidden = true
        
        keyboardDismisser()
    }

    @IBAction func eurSwitchChange(_ sender: UISwitch) 
    {
        convertLogic.setEurSwitch(sender.isOn)
    }
    
    @IBAction func gbpSwitchChange(_ sender: UISwitch) 
    {
        convertLogic.setGbpSwitch(sender.isOn)
    }
    @IBAction func jpySwitchChange(_ sender: UISwitch) 
    {
        convertLogic.setJpySwitch(sender.isOn)
    }
    @IBAction func cadSwitchChange(_ sender: UISwitch) 
    {
        convertLogic.setCadSwitch(sender.isOn)
    }
    
    @IBAction func usdTextChange(_ sender: UITextField) 
    {
        convertLogic.setUsdAmount(usdTextField.text!)
        errorLabel.isHidden = true
    }

    @IBAction func convertButtonPressed(_ sender: Any)
    {
        if usdTextField.text == nil || !convertLogic.isValidValue(usdTextField.text!)
        {
            errorLabel.text = "Error: Enter a valid amount in USD"
            errorLabel.isHidden = false
            return
        }
        
        // Navigate to the next view controller to display the converted currencies.
        performSegue(withIdentifier: "toConverted", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "toConverted"
        {
            let covertedViewController = segue.destination as! CovertedViewController
            
            // Pass in the convertLogic object
            covertedViewController.convertLogic = convertLogic
        }
    }
    
    // Allows the keyboard to be dismissed if using the phone keyboard
    func keyboardDismisser()
    {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() 
    {
        view.endEditing(true)
    }
}


