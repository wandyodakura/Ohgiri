//
//  ViewController.swift
//  ohgiri-app
//
//  Created by 小田倉真弘 on 2017/10/22.
//  Copyright © 2017年 masahiro.odakura. All rights reserved.
//

import UIKit
import ESTabBarController
import Firebase
import FirebaseAuth
class ViewController: UIViewController {
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 設定メソッドを呼べば、OK
        setupTab()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // currentUserがnilならログインしていない
        if Auth.auth().currentUser == nil {
            // ログインしていないときの処理
            // viewDidAppear内でpresent()を呼び出しても表示されないためメソッドが終了してから呼ばれるようにする
            DispatchQueue.main.async {
                let registerViewController = self.storyboard?.instantiateViewController(withIdentifier: "Register")
                self.present(registerViewController!, animated: true, completion: nil)
            }
        }
    }
    
    /// EsTab設定
    func setupTab() {
        
        // 画像のファイル名を指定してESTabBarControllerを作成する
        let tabBarController: ESTabBarController! = ESTabBarController(tabIconNames: ["home", "group", "all", "ranking"])
        
        // 背景色、選択時の色を設定する
        tabBarController.selectedColor = UIColor(red: 1.0, green: 0.44, blue: 0.11, alpha: 1)
        tabBarController.buttonsBackgroundColor = UIColor(red: 0.96, green: 0.91, blue: 0.87, alpha: 1)
        
        // 作成したESTabBarControllerを親のViewController（＝self）に追加する
        addChildViewController(tabBarController)
        view.addSubview(tabBarController.view)
        tabBarController.view.frame = view.bounds
        tabBarController.didMove(toParentViewController: self)
        
        // タブをタップした時に表示するViewControllerを設定する
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: "Home")
        let groupViewController = storyboard?.instantiateViewController(withIdentifier: "Group")
        let allViewController = storyboard?.instantiateViewController(withIdentifier: "All")
        let rankingViewController = storyboard?.instantiateViewController(withIdentifier: "Ranking")
        
        tabBarController.setView(homeViewController, at: 0)
        tabBarController.setView(groupViewController, at: 1)
        tabBarController.setView(allViewController, at: 2)
        tabBarController.setView(rankingViewController, at: 3)
        
    }
}

