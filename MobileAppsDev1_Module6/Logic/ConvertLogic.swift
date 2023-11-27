//
//  ConvertLogic.swift
//  MobileAppsDev1_Module6
//
//  Created by Michael Medlin on 11/26/23.
//

import Foundation

class ConvertLogic
{
    var eurSwitch = true
    var gbpSwitch = true
    var jpySwitch = true
    var cadSwitch = true
    var usdInput : String = ""
    let moneyRegex = "^[-+]?[0-9]+(\\.[0-9]{0,2})?$"
    
    func isValidValue(_ input: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", moneyRegex)
        let isValidNumber = predicate.evaluate(with: input)
        
        // Check if the input is a valid number
        if !isValidNumber {
            return false
        }
        
        // Check if the input has a decimal point but no more than two decimal places
        let components = input.components(separatedBy: ".")
        if components.count > 2 || components.count == 2 && components[1].count > 2 {
            return false
        }
        
        return true
    }
    func setEurSwitch(_ switchValue: Bool)
    {
        if switchValue 
        {
            self.eurSwitch = true
        }
        else
        {
            self.eurSwitch = false
        }
        
    }
    func setGbpSwitch(_ switchValue: Bool)
    {
        if switchValue 
        {
            self.gbpSwitch = true
        }
        else 
        {
            self.gbpSwitch = false
        }
    }
    func setJpySwitch(_ switchValue: Bool)
    {
        if switchValue
        {
            self.jpySwitch = true
        }
        else 
        {
            self.jpySwitch = false
        }
    }
    func setCadSwitch(_ switchValue: Bool)
    {
        if switchValue 
        {
            self.cadSwitch = true
        }
        else
        {
            self.cadSwitch = false
        }
    }
    func setUsdAmount(_ amountValue: String)
    {
        usdInput = amountValue
    }
    
    func getEurSwitch() -> Bool
    {
        return eurSwitch
    }
    func getGbpSwitch() -> Bool
    {
        return gbpSwitch
    }
    func getJpySwitch() -> Bool
    {
       return jpySwitch
    }
    func getCadSwitch() -> Bool
    {
        return cadSwitch
    }
    func getUsdAmount() -> String
    {
        return usdInput
    }
    
    func toEur(_ usd: Double) -> Double
    {
        return usd * 0.91
    }
    func toGbp(_ usd: Double) -> Double
    {
        return usd * 0.77
    }
    func toJpy(_ usd: Double) -> Double
    {
        return usd * 139.29
    }
    func toCad(_ usd: Double) -> Double
    {
        return usd * 1.29
    }
    
    
    
    
    
}
