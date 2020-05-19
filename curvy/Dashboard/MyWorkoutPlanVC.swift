//
//  MyWorkoutPlanVC.swift
//
//
//  Created by user166656 on 4/25/20.
//
//MyWorkoutImgView   MyworkoutPlanTV

import UIKit

class MyWorkoutPlanVC: UIViewController {
    var workLoseImage :String!
    var workoutPlan: Plan = Plan()
        var descriptionText: String = ""
    
    @IBOutlet weak var MyWorkoutImgView: UIImageView!
    
    @IBOutlet weak var MyworkoutPlanTV: UITextView!
    override func viewDidLoad() {
            super.viewDidLoad()
            print("Inside MyworkOut VC")
            print("Id - \(userInstance.workoutPlanId)")
        
        if(userInstance.workoutPlanId == 0)
        {
            
            let alertcontroller = UIAlertController(title: "Alert", message: "Please select a workout plan and visit this page !!!", preferredStyle: .alert)
         let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
         alertcontroller.addAction(okAction)
         self.present(alertcontroller, animated: true, completion: nil)
        }
        
        let result: Plan  = workoutPlan.ExistedWorkOutPlan(id: userInstance.workoutPlanId)!
            // Do any additional setup after loading the view.
    
            for desc in result.planDetailsList
            {
                descriptionText += "\(desc)\n"
            }
    
           MyworkoutPlanTV.text = descriptionText
            self.workLoseImage = userInstance.workoutPicture
            
            MyWorkoutImgView.image = UIImage(named: workLoseImage)
            print(descriptionText)
            
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
