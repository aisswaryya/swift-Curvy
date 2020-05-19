//
//  LoseWeightDetailsVC.swift
//  curvy
//
//  Created by user166656 on 4/23/20.
//  Copyright © 2020 Aisswaryya Murugananth. All rights reserved.
//

import UIKit

class LoseWeightDetailsVC: UIViewController {

    @IBOutlet weak var wlworkoutdetailImgVC: UIImageView!
    @IBOutlet weak var wrkWLtextView: UITextView!
    @IBOutlet weak var detailTitlewlw: UILabel!
    
    var workLoseImage :String!
    var workLoseTitle:String!
    var workLoseCategory:String!
    var workLoseDescription:String!
    var planId: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = workLoseTitle
        
        wlworkoutdetailImgVC.image = UIImage(named: workLoseImage)
        detailTitlewlw.text = workLoseTitle
        wrkWLtextView.text = workLoseDescription
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func addWorkLose(_ sender: UIButton) {
        userInstance.workoutPlanId = Int(planId!) ?? 0
        userInstance.workoutPicture = workLoseImage!
        print("Weight Lose Workout Plan Added - \(userInstance.workoutPlanId)")
        let alertcontroller = UIAlertController(title: "Alert", message: " Workout Plan added !!!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        alertcontroller.addAction(okAction)
        self.present(alertcontroller, animated: true, completion: nil)
    }
    
    

}
