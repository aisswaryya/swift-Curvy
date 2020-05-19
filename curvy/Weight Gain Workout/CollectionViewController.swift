//
//  CollectionViewController.swift
//  curvy
//
//  Created by user166656 on 4/23/20.
//  Copyright © 2020 Aisswaryya Murugananth. All rights reserved.
//

import UIKit

private let reuseIdentifier = "gainCell"

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{

    var gainPlanItems = [[String: String]] ()
    
    func loadPlist() -> [[String:String]]{
        let path = Bundle.main.path(forResource: "gainWeightPlans", ofType: "plist")
        return NSArray.init(contentsOf: URL.init(fileURLWithPath: path!)) as! [[String:String]]
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gainPlanItems = loadPlist()
        
        self.navigationItem.title = " Weight Gain Workout "

        
    }


    // MARK: - Navigation

     //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         //Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetail"{
            let detail = segue.destination as! DetailViewController
            
            //if any cell is selected
            if let indexPath = self.collectionView?.indexPath(for: sender as! UICollectionViewCell) {
                
                let item = self.gainPlanItems[indexPath.row]
                
                detail.planImage = item["picture"]
                detail.planTitle = item["name"]
                detail.planCategory = item["category"]
                detail.planDescription = item["introduction"]
                detail.planId = item["planId"]            }
        }

    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return self.gainPlanItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gainCell", for: indexPath) as! CollectionViewCell
    
        // Configure the cell
        
        let plan = self.gainPlanItems[indexPath.row]
        cell.cellImageView.image = UIImage(named: plan["picture"]!)
    
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
