//
//  NewGroupViewController.swift
//  ohgiri-app
//
//  Created by 小田倉真弘 on 2017/11/08.
//  Copyright © 2017年 masahiro.odakura. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SVProgressHUD

class NewGroupViewController: UIViewController {
    
    @IBOutlet weak var passwardTextField: UITextField!
    @IBOutlet weak var groupNameTextField: UITextField!
    var userInfo: UserInfo?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func newGroupButton(_ sender: Any) {
        // 辞書を作成してFirebaseに保存する
        let postRef = Database.database().reference().child(Const.GroupPath)
        let groupData = ["name": groupNameTextField.text!, "passward": passwardTextField.text!,"readerName": userInfo?.name]
        postRef.childByAutoId().setValue(groupData)
        
        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "投稿しました")
        
        // 全てのモーダルを閉じる
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true,completion: nil)
        
        
        
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
