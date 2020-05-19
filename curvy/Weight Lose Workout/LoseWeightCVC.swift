//
//  LoseWeightCVC.swift
//  curvy
//
//  Created by user166656 on 4/23/20.
//  Copyright © 2020 Aisswaryya Murugananth. All rights reserved.
//

import UIKit

private let reuseIdentifier = "loseWeightCell"

class LoseWeightCVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var loseExItems = [[String: String]]()
    
    func loadPlist() -> [[String:String]]{
        let path = Bundle.main.path(forResource: "loseWorkoutPlans", ofType: "plist")
        return NSArray.init(contentsOf: URL.init(fileURLWithPath: path!)) as! [[String:String]]
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        self.loseExItems = loadPlist()
        
        self.navigationItem.title = "Weight Loss Workout"
        
            }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showLWDetail"{
        let detail = segue.destination as! LoseWeightDetailsVC
            
            //if any cell is selected
                if let indexPath = self.collectionView?.indexPath(for: sender as! UICollectionViewCell) {
                    
                    let item = self.loseExItems [indexPath.row]
                    
                    detail.workLoseImage = item["picture"]
                    detail.workLoseTitle = item["name"]
                    detail.workLoseCategory = item["category"]
                    detail.workLoseDescription = item["introduction"]
                    detail.planId = item["planId"]
                    
            }
            }

    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.loseExItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "loseWeightCell", for: indexPath) as! LoseWeightCVCell
    
        // Configure the cell
        let losePlan = self.loseExItems[indexPath.row]
        cell.loseExImageView.image = UIImage(named: losePlan["picture"]!)
           
    
        return cell
    }
    // to set each item size
    //to check screen size and set item size accordingly
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize : CGRect = UIScreen.main.bounds
        var widthCell = 0
        var heightCell = 0
        
        //iPhone  6+, 7+,8+
        if screenSize.width == 414 {
           
            widthCell = 191
            heightCell = 125
            
        }
        
        //iPhone X,6,7,8
        if screenSize.width == 375 {
           
            widthCell = 172
            heightCell = 125
            
        }
              
        //Others
        if screenSize.width == 320 {
           
            widthCell = 144
            heightCell = 125
            
        }
        return CGSize(width: widthCell, height: heightCell)
    }
    
}
