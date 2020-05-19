//
//  ViewController.swift
//  curvy
//
//  Created by user166656 on 4/22/20.
//  Copyright © 2020 Aisswaryya Murugananth. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginBtn(_ sender: UIButton) {
        var uname: String = userNameTF.text!
        var password: String =
        passwordTF.text!
        
        if((uname != "Admin") && (password != "Admin"))
        {
            let alertcontroller = UIAlertController(title: "Alert", message: "Invalid credential. Try again!!!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
            alertcontroller.addAction(okAction)
            self.present(alertcontroller, animated: true, completion: nil)        }
    }
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var userNameTF: UITextField!

}
