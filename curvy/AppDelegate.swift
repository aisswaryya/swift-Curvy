//
//  AppDelegate.swift
//  curvy
//
//  Created by user166656 on 4/22/20.
//  Copyright © 2020 Aisswaryya Murugananth. All rights reserved.
//

import UIKit
import SwiftyJSON
import SQLite

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let planId = Expression<Int>("id")
               let planName = Expression<String>("name")
               let planType = Expression<String>("type")
    let planDescription = Expression<String>("description")
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().tintColor = .red

        
        let url = Bundle.main.url(forResource: "WorkoutPlan", withExtension: "json")!
    do {
        let jsonData = try Data(contentsOf: url)

        if let json = try? JSON(data: jsonData) {

                                 for (key, subJson) in json["data"] {
                                    print("***********************")
            
                                    let jsonPlan: Plan = Plan()
                                    jsonPlan.planId = subJson["id"].intValue
                                    jsonPlan.planName = subJson["name"].stringValue
                                    print(subJson["id"].intValue)
                                    print(subJson["name"].stringValue)
                                    print(subJson["description"].arrayValue)
                                    let descriptionList: Array<JSON> = subJson["description"].arrayValue
                                    for desc in descriptionList {
                                        print(desc.stringValue)
                                        jsonPlan.planDetailsList.append(desc.stringValue)
                                    }
                                    workoutPlanList.append(jsonPlan)
                                    
                                    
                                    
            }
            
        }
        
    }
    catch {
        print(error)
    }
        
  print("Workout List")
    for plan in workoutPlanList {
        
        print(String(plan.planId))
        print(plan.planName)
        for desc in plan.planDetailsList{
            print(desc)
        }
         }
        
         let dietUrl = Bundle.main.url(forResource: "DietPlan", withExtension: "json")!
           do {
               let jsonData = try Data(contentsOf: dietUrl)

               if let json = try? JSON(data: jsonData) {

                                        for (key, subJson) in json["data"] {
                                           print("***********************")
                   
                                           let jsonPlan: Plan = Plan()
                                           jsonPlan.planId = subJson["id"].intValue
                                           jsonPlan.planName = subJson["name"].stringValue
                                           print(subJson["id"].intValue)
                                           print(subJson["name"].stringValue)
                                           print(subJson["description"].arrayValue)
                                           let descriptionList: Array<JSON> = subJson["description"].arrayValue
                                           for desc in descriptionList {
                                               print(desc.stringValue)
                                               jsonPlan.planDetailsList.append(desc.stringValue)
                                           }
                                           dietPlanList.append(jsonPlan)
                                           
                   }
                   
               }
               
           }
           catch {
               print(error)
           }
               
         print("###################Dietplan List")
           for plan in dietPlanList {
               
               print(String(plan.planId))
               print(plan.planName)
               for desc in plan.planDetailsList{
                   print(desc)
               }
                }

        dbCreate()
        createPlanTable()
        
        return true

}
     func dbCreate() {
        
       
       do{
          
           let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
           let fileUrl = documentDirectory.appendingPathComponent("plans").appendingPathExtension("sqlite3")
                               
           let database = try Connection(fileUrl.path)
      
           
           planInstance.database = database
   
           
        try planInstance.database.run(planInstance.plansTable.drop())
           
           print("DB Created")
              
          }
          catch{
              print(error)
          }
      }
    
    func createPlanTable()
    {
            let planId = Expression<Int>("id")
            let planName = Expression<String>("name")
            let planDescription = Expression<String>("description")
            let planType = Expression<String>("type")
            let createTable = planInstance.plansTable.create { (table) in
            table.column(planId, primaryKey: true)
            table.column(planName)
            table.column(planDescription)
            table.column(planType)
        }
        
        do {
            try planInstance.database.run(createTable)
            print("Plan Table Created")
            preLoadData()
        } catch {
            print(error)
        }
        
    }
    
    func preLoadData(){
        for plan in workoutPlanList {
        
        print(String(plan.planId))
        print(plan.planName)
            
            
        let insertPlan =
            planInstance.plansTable.insert(self.planId <- plan.planId, self.planName <- plan.planName,
                                           self.planType <- "WorkoutPlan", self.planDescription <- "")
        
        do {
            try planInstance.database.run(insertPlan)
            print("INSERTED workout plan")
 
        } catch {
            print(error)
        }
    }
        for plan in dietPlanList {
            
            print(String(plan.planId))
            print(plan.planName)
                
                
            let insertPlan =
                planInstance.plansTable.insert(self.planId <- plan.planId, self.planName <- plan.planName,
                                               self.planType <- "DietPlan", self.planDescription <- "")
            
            do {
                try planInstance.database.run(insertPlan)
                print("INSERTED diet plan")
    
            } catch {
                print(error)
            }
        }
        loadData()
    }
    
    func loadData()
    {
        print("View Plans")
        
        do {
            let plans = try planInstance.database.prepare(planInstance.plansTable)
            sampleWorkoutPlanList.removeAll()
            for plan in plans {
                let dbPlan = Plan()
                dbPlan.planId =  plan[self.planId]
                dbPlan.planName = plan[self.planName]
                dbPlan.planType = plan[self.planType]
       
                sampleWorkoutPlanList.append(dbPlan)
                print("planId: \(plan[self.planId]), planName: \(plan[self.planName]),address: \(plan[self.planType])")
        
            }
        } catch {
            print(error)
        }
    }
    
}
