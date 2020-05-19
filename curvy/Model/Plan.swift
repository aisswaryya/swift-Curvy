//
//  plan.swift
//  curvy
//
//  Created by user166656 on 4/23/20.
//  Copyright © 2020 Aisswaryya Murugananth. All rights reserved.
//

import UIKit
import SQLite

class Plan{
    
    var planId:Int = 0
    var planName:String = ""
    var planDetailsList : [String] = []
    var database: Connection!
    var plansTable = Table("plans")
    var planType : String = ""
    
    init(planID:Int, planName:String, planDetails:[String])
    {
        self.planId = planID
        self.planName = planName
        self.planDetailsList = planDetails
    }
    init(){}
    
    func ExistedWorkOutPlan(id:Int) -> Plan?{
            for Plan in workoutPlanList{
                if(Plan.planId == id){
                print("From Exist Workout Plan Method")
                return Plan
            }
        }
        return nil
    }
    
    func ExistedDietPlan(id:Int) -> Plan?{
        print("From Filter\(id)")

        
            for Plan in dietPlanList{
                if(Plan.planId == id){
                print("From Exist Diet Plan Method")
                return Plan
            }
        }
        return nil
    }}

var workoutPlanList : Array<Plan> = Array()
var dietPlanList : Array<Plan> = Array()

var planInstance = Plan()

var sampleWorkoutPlanList : Array<Plan> = Array()
var sampleDietPlanList : Array<Plan> = Array()
