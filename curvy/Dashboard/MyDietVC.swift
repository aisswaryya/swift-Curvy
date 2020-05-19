//
//  MyDietVC.swift
//  curvy
//
//  Created by user166656 on 4/25/20.
//  Copyright © 2020 Aisswaryya Murugananth. All rights reserved.
//

import UIKit

class MyDietVC: UIViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        print("Hello world")
//        // Do any additional setup after loading the view.
//    }
    var dietImage: String!
    
    @IBOutlet weak var mydietPlanImgView: UIImageView!
    
      var dietPlan: Plan = Plan()
        var descriptionText: String = ""
        override func viewDidLoad() {
            super.viewDidLoad()
            print("Inside MyworkOut VC")
            print("ID - \(userInstance.dietPlanId)")
            
            
            if(userInstance.dietPlanId == 0)
            {
                
                let alertcontroller = UIAlertController(title: "Alert", message: "Please select a diet plan and visit this page !!!", preferredStyle: .alert)
             let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
             alertcontroller.addAction(okAction)
             self.present(alertcontroller, animated: true, completion: nil)
            }
            
            let result: Plan  = dietPlan.ExistedDietPlan(id: userInstance.dietPlanId)!
            // Do any additional setup after loading the view.
    
            for desc in result.planDetailsList
            {
                descriptionText += "\(desc)\n"
            }
    
           myDietTextView.text = descriptionText
            self.dietImage = userInstance.dietPicture
            
            mydietPlanImgView.image = UIImage(named: dietImage)
            print(descriptionText)
        }

    @IBOutlet weak var myDietTextView: UITextView!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
