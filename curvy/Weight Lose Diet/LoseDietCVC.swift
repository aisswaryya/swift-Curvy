//
//  LoseDietCVC.swift
//  curvy
//
//  Created by user166656 on 4/24/20.
//  Copyright © 2020 Aisswaryya Murugananth. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CellDietLose"

class LoseDietCVC: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var loseDietItems = [[String:String]]()
    
    func loadDietPlist() -> [[String:String]]{
        let path = Bundle.main.path(forResource: "loseDietPlan", ofType: "plist")
            return NSArray.init(contentsOf: URL.init(fileURLWithPath: path!)) as! [[String:String]]
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loseDietItems = loadDietPlist()
        
        self.navigationItem.title = "Weight Lose Diet"
        
           }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showDietLoseDetail"{
            let detail = segue.destination as!
            LoseDietVC
            
            //if any cell is selected
            if let indexPath = self.collectionView?.indexPath(for: sender as! UICollectionViewCell) {
                let item = self.loseDietItems[indexPath.row]
                
                detail.dietLImage = item["picture"]
                detail.dietLTitle = item["name"]
                detail.dietLDescription = item["introduction"]
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
        return self.loseDietItems.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellDietLose", for: indexPath) as! LoseDietCVCell
        
        let item = self.loseDietItems[indexPath.row]
        
        cell.cellDietLose.image = UIImage(named: item["picture"]!)
       
        // Configure the cell
    
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
