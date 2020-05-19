//
//  user.swift
//  curvy
//
//  Created by user166656 on 4/23/20.
//  Copyright © 2020 Aisswaryya Murugananth. All rights reserved.
//

import UIKit

class User{
    
    var userId:Int = 0
    var userName:String = ""
    var workoutPlanId:Int = 0
    var dietPlanId:Int = 0
    // or plan array
    var workoutName:String = ""
    var dietName: String = ""
    var workoutPicture: String = ""
    var dietPicture: String = ""
    var workoutList : [String] = []
    var dietList: [String] = []
    
    
    init(userID:Int, userName:String, workoutPlanID:Int, dietPlanID:Int, workoutName:String,DietName:String, workoutPicture:String, dietPictureString:String, workoutList:[String],dietLIst:[String])
       {
           self.userId = userID
           self.userName = userName
           self.workoutPlanId = workoutPlanID
        self.dietPlanId = dietPlanID
        self.workoutName = workoutName
        self.dietName = DietName
        self.workoutPicture = workoutPicture
        self.dietPicture = dietPictureString
        self.workoutList = workoutList
        self.dietList = dietLIst
       }
       init(){}


}

var userInstance = User()
