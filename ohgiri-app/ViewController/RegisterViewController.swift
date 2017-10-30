//
//  RegisterViewController.swift
//  ohgiri-app
//
//  Created by 小田倉真弘 on 2017/10/26.
//  Copyright © 2017年 masahiro.odakura. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
 
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func registerButton(_ sender: Any){
        
         self.dismiss(animated: true, completion: nil)
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
