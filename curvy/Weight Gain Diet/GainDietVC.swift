//
//  GainDietDVCViewController.swift
//  curvy
//
//  Created by user166656 on 4/24/20.
//  Copyright © 2020 Aisswaryya Murugananth. All rights reserved.
//

import UIKit

class GainDietVC: UIViewController {
    
    
    @IBOutlet weak var detailDGImgView: UIImageView!
    
    @IBOutlet weak var detailDGTitle: UILabel!
    
    @IBOutlet weak var detailDGIntro: UITextView!
    
    //add plan
    @IBAction func addDietGain(_ sender: UIButton) {
        userInstance.dietPlanId = Int(dietPlanId!) ?? 0
        userInstance.dietPicture = dietGImage!
        print("Weight Gain Diet Plan Added - \(userInstance.dietPlanId)")
        
        let alertcontroller = UIAlertController(title: "Alert", message: " Diet Plan added !!!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        alertcontroller.addAction(okAction)
        self.present(alertcontroller, animated: true, completion: nil)
    }
    //assign fetched value to variables
    var dietGImage: String!
    var dietGTitle: String!
    var dietGCategory: String!
    var dietGDescription: String!
    var dietPlanId: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = dietGTitle
        detailDGImgView.image = UIImage(named: dietGImage)
        detailDGTitle.text = dietGTitle
        detailDGIntro.text = dietGDescription
        
        
    }

    

    
}
