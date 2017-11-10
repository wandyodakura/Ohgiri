//
//  passwordViewController.swift
//  ohgiri-app
//
//  Created by 小田倉真弘 on 2017/11/09.
//  Copyright © 2017年 masahiro.odakura. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class passwordViewController: UIViewController {

    @IBOutlet weak var passwardTextField: UITextField!
    var groupInfo: GroupInfo?
    var userInfo: UserInfo?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func joinButton(_ sender: UIButton) {
        //もしパスワードが正しければgroupInfoにuserIdを加え、間違えてれば入れない
        let myId = userInfo?.id
        groupInfo?.users.append(myId!)
        
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
