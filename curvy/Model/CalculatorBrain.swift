//
//  BMI.swift
//  curvy
//
//  Created by user166656 on 4/24/20.
//  Copyright © 2020 Aisswaryya Murugananth. All rights reserved.
//

import Foundation


struct CalculatorBrain {
let weightInKG: Double
let heightInCM: Double
    let age : Double
    let gender: String

//init(weightInKG: String, heightInCM: String) {
//    self.weightInKG = Double(weightInKG) ?? 0.0
//    self.heightInCM = Double(heightInCM) ?? 0.0
//}
    
    init(weightInKG: String, heightInCM: String, age: String, gender:String) {
        self.weightInKG = Double(weightInKG) ?? 0.0
        self.heightInCM = Double(heightInCM) ?? 0.0
        self.age = Double(age) ?? 0.0
        self.gender = gender
    }
func calcBmi() -> Double {
    
    return weightInKG / ((heightInCM * heightInCM) / 10000)
}
   
    func calFatTest() -> Double {
        let bmi = calcBmi()
        var fatContent = 0.0
        
        let temp = (1.20 * bmi) + (0.23 * age)
        
        if (self.gender == "Male" || self.gender == "male" || self.gender == "MALE"){
             fatContent = Double( temp - 16.2)
            
            
        }else if (self.gender == "Female" || self.gender == "female" || self.gender == "FEMALE"){
            fatContent = Double(temp - 5.4)
        }
        else{
            fatContent = 500.00
        }
        return fatContent
    }

}

