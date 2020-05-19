//
//  DetailViewController.swift
//  curvy
//
//  Created by user166656 on 4/23/20.
//  Copyright © 2020 Aisswaryya Murugananth. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var detailImage: UIImageView!
    
    @IBOutlet weak var detailTitle: UILabel!
    
    @IBOutlet weak var detailCategory: UILabel!
    
    @IBOutlet weak var detailDescription: UITextView!
    
        
    
    //assign fetched value to variables
    var planImage: String!
    var planTitle: String!
    var planCategory: String!
    var planDescription: String!
    var planId: String!
   
    
        @IBAction func addGainWorkPlan(_ sender: UIButton) {
            print("Plan Id - \(planId!)")
            userInstance.workoutPlanId = Int(planId!) ?? 0
            
            userInstance.workoutPicture = planImage!
             print("Weight Gain Workout Plan Added - \(userInstance.workoutPlanId)")
            
              let alertcontroller = UIAlertController(title: "Alert", message: " Workout Plan added !!!", preferredStyle: .alert)
                   let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
                   alertcontroller.addAction(okAction)
                   self.present(alertcontroller, animated: true, completion: nil)
            
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = planTitle
        
        detailImage.image = UIImage(named: planImage)
        detailTitle.text = planTitle
        detailCategory.text = planCategory
        detailDescription.text = planDescription
    }
    

    
}
