//
//  CovertedViewController.swift
//  MobileAppsDev1_Module6
//
//  Created by Michael Medlin on 11/26/23.
//

import UIKit

class CovertedViewController: UIViewController {

    
    @IBOutlet weak var usdAmount: UILabel!
    @IBOutlet weak var eurAmount: UILabel!
    @IBOutlet weak var gbpAmount: UILabel!
    @IBOutlet weak var japAmount: UILabel!
    @IBOutlet weak var cadAmount: UILabel!
    
    @IBOutlet weak var eurLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var cadLabel: UILabel!
    
    var convertLogic = ConvertLogic()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        // Calculate the converted currencies
        let usd = Double(convertLogic.getUsdAmount())!
        // Display the converted currencies
        usdAmount.text = "Amount in USD: \(usd)"

        
        // Set the label text based on selected currencies
        if convertLogic.getEurSwitch(){
            // Convert to EUR
            eurAmount.text = "Amount: \(convertLogic.toEur(usd))"
            eurAmount.isHidden = false
            eurLabel.isHidden = false
        }
        else
        {
            eurAmount.isHidden = true
            eurLabel.isHidden = true
        }
        if convertLogic.getGbpSwitch() {
            // Convert to GBP
            gbpAmount.text = "Amount: \(convertLogic.toGbp(usd))"
            gbpAmount.isHidden = false
            gbpLabel.isHidden = false
        }
        else
        {
            gbpAmount.isHidden = true
            gbpLabel.isHidden = true
        }
        if convertLogic.getJpySwitch() {
            // Convert to JPY
            japAmount.text = "Amount: \(convertLogic.toJpy(usd))"
            japAmount.isHidden = false
            jpyLabel.isHidden = false
        }
        else
        {
            japAmount.isHidden = true
            jpyLabel.isHidden = true
        }
        if convertLogic.getCadSwitch() {
            // Convert to CAD
            cadAmount.text = "Amount: \(convertLogic.toCad(usd))"
            cadAmount.isHidden = false
            cadLabel.isHidden = false
        }
        else
        {
            cadAmount.isHidden = true
            cadLabel.isHidden = true
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
