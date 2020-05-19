//
//  BMIVC.swift
//  curvy
//
//  Created by user166656 on 4/24/20.
//  Copyright © 2020 Aisswaryya Murugananth. All rights reserved.
//

import UIKit

class BMIVC: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var heightTF: UITextField!
    
    @IBOutlet weak var weightTF: UITextField!
    
 
    @IBOutlet weak var resultDisplayLbl: UILabel!
    
    override func viewDidLoad() {
     super.viewDidLoad()
        
    }
    
    
    
    
    @IBAction func generateBMIResult(_ sender: UIButton) {
        
        guard let weightInKG = weightTF.text,
        let heightInCM = heightTF.text else {
            return
    }
        let cm = CalculatorBrain(weightInKG: weightInKG, heightInCM: heightInCM, age: "", gender: "")
    let result = cm.calcBmi()
        
        let bmiResult = Double(round(1000*result)/1000)
        print(bmiResult)  // 1.236
        resultDisplayLbl.text = "\(bmiResult)"
        if(resultDisplayLbl.text == "-nan")
        {
            resultDisplayLbl.text = ""
             let alertcontroller = UIAlertController(title: "Alert", message: "Invalid input data. Try again with numeric values!!!", preferredStyle: .alert)
                       let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
                       alertcontroller.addAction(okAction)
                       self.present(alertcontroller, animated: true, completion: nil)          }
        
    }
    
    

}

