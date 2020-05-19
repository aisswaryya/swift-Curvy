//
//  LoseDietVC.swift
//  curvy
//
//  Created by user166656 on 4/24/20.
//  Copyright © 2020 Aisswaryya Murugananth. All rights reserved.
//

import UIKit

class LoseDietVC: UIViewController {
    
       
    
    @IBOutlet weak var loseDietImgView: UIImageView!
    
    @IBOutlet weak var loseDietDetailTitle: UILabel!
    
    @IBOutlet weak var loseDietText: UITextView!
    
    @IBAction func addLoseDiet(_ sender: UIButton) {
        
        userInstance.dietPlanId = Int(planId!) ?? 0
        userInstance.dietPicture = dietLImage!
        print("Weight Lose Diet Plan Added - \(userInstance.dietPlanId)")
          let alertcontroller = UIAlertController(title: "Alert", message: " Diet Plan added !!!", preferredStyle: .alert)
              let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
              alertcontroller.addAction(okAction)
              self.present(alertcontroller, animated: true, completion: nil)
    }
    
    
    var dietLImage: String!
    var dietLTitle: String!
    var dietLCategory: String!
    var dietLDescription: String!
    var planId: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = dietLTitle
        
        loseDietImgView.image = UIImage(named: dietLImage)
        loseDietDetailTitle.text = dietLTitle
        loseDietText.text = dietLDescription
    }
}


