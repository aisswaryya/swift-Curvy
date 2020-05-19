//
//  FatTestVC.swift
//  curvy
//
//  Created by user166656 on 4/24/20.
//  Copyright © 2020 Aisswaryya Murugananth. All rights reserved.
//

import UIKit

class FatTestVC: UIViewController {
    
    
    @IBOutlet weak var genderTF: UITextField!
    
    @IBOutlet weak var heightTF: UITextField!
    
    
    @IBOutlet weak var weightTF: UITextField!
    
    
    @IBOutlet weak var ageTF: UITextField!
    
    @IBOutlet weak var fatResultDisplayLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func generateFatResult(_ sender: UIButton) {
        
        guard let genderValue = genderTF.text,
            let heightVal = heightTF.text ,
            let weightVal = weightTF.text ,
            let ageVal = ageTF.text   else{
                return
        }
        let calcu = CalculatorBrain(weightInKG: weightVal, heightInCM: heightVal, age: ageVal, gender: genderValue)
        let result = calcu.calFatTest()
        
        let fatresult = Double(round(1000*result)/1000)
        print(fatresult)  // 1.236
        fatResultDisplayLbl.text = "\(fatresult)"
        
        if(Double(ageVal) == nil)
        {
            fatResultDisplayLbl.text = ""
            let alertcontroller = UIAlertController(title: "Alert", message: "Invalid Age. Try again with numeric values!!!", preferredStyle: .alert)
         let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
         alertcontroller.addAction(okAction)
         self.present(alertcontroller, animated: true, completion: nil)
        }
        
        if(Double(heightVal) == nil)
        {
            fatResultDisplayLbl.text = ""
            let alertcontroller = UIAlertController(title: "Alert", message: "Invalid Height data. Try again with numeric values!!!", preferredStyle: .alert)
         let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
         alertcontroller.addAction(okAction)
         self.present(alertcontroller, animated: true, completion: nil)
        }
        
        
        if(Double(weightVal) == nil)
        {
            fatResultDisplayLbl.text = ""
            let alertcontroller = UIAlertController(title: "Alert", message: "Invalid Weight data. Try again with numeric values!!!", preferredStyle: .alert)
         let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
         alertcontroller.addAction(okAction)
         self.present(alertcontroller, animated: true, completion: nil)
        }
        
        if(fatResultDisplayLbl.text == "500.0")
        {
         fatResultDisplayLbl.text = ""
         let alertcontroller = UIAlertController(title: "Alert", message: "Invalid Gender. Try again!!!", preferredStyle: .alert)
                   let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
                   alertcontroller.addAction(okAction)
                   self.present(alertcontroller, animated: true, completion: nil)
        }
    }
    
}
