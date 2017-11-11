//
//  AllViewController.swift
//
//
//  Created by 小田倉真弘 on 2017/10/26.
//
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class AllViewController: UIViewController {
    
    @IBOutlet weak var allTableView: UITableView!
    var bokeData: BokeData?
    var userInfo: UserInfo?
    var bokeArray: [BokeData] = []
    var votes:[String] = [""]
    var odaiBox: odaiBox?
    
    
    var timer: Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        allTableView.delegate=self
        allTableView.dataSource=self
        
        // Do any additional setup after loading the view.
        allTableView.allowsSelection = false
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        timer = Timer.scheduledTimer(timeInterval: 86400.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        timer.fire()
        bokeArray.sort { $0.likes.count > $1.likes.count }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        timer.invalidate()
    }
    
    func update(tm: Timer) {
        // do something
        //２４時間でtableViewをリセット
        let allTableViewCell = AllTableViewCell()
        allTableViewCell.bokeData = nil
        if allTableViewCell.number! < (userInfo?.allRecord)!{
            let postRef = Database.database().reference().child(Const.BokePath).child((userInfo?.id!)!)
            let allRecord = ["allRecord": allTableViewCell.number]
            postRef.updateChildValues(allRecord)
        }
        allTableViewCell.number = nil
        
        self.allTableView.reloadData()
        
    }
    func handleButton(sender: UIButton, event:UIEvent){
        print("DEBUG_PRINT: likeボタンがタップされました。")
        
        // タップされたセルのインデックスを求める
        let touch = event.allTouches?.first
        let point = touch!.location(in: self.allTableView)
        let indexPath = allTableView.indexPathForRow(at: point)
        
        // 配列からタップされたインデックスのデータを取り出す
        let bokeData = bokeArray[indexPath!.row]
        
        let myId = userInfo?.id
        votes.append(myId!)
        userInfo?.votesRecord.append(myId!)
        
        
        
        if votes.contains("myId") {
            
            sender.isEnabled = false
            
            print("DEBUG_PRINT:　投票は一つまでです。")
            if let uid = Auth.auth().currentUser?.uid {
                if bokeData.isLiked {
                    
                    sender.isEnabled = false
                } else {
                    bokeData.likes.append(uid)
                }
                
                // 増えたlikesをFirebaseに保存する
                let postRef = Database.database().reference().child(Const.BokePath).child(bokeData.id!)
                let likes = ["likes": bokeData.likes]
                postRef.updateChildValues(likes)
                
            }
            
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

/**
 こういう風にdelegateなどはextension(拡張) で書き方分けたほうがわかりやすいですよ
 */

// MARK: - UITableViewDataSource
extension AllViewController: UITableViewDataSource {
    
    /// セルの数
    ///
    /// - Parameters:
    ///   - tableView: UITableView
    ///   - section: Int
    /// - Returns: セル数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: 後ほどしっかり組む
        return bokeArray.count
    }
    
    /// セルの設定
    ///
    /// - Parameters:
    ///   - tableView: UITableView
    ///   - indexPath: IndexPath
    /// - Returns: セル
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: 後ほどしっかり組む
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! GroupTableViewCell
        cell.setBokeData(bokeData: bokeArray[indexPath.row])
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            //ランキングをtableViewの上からつけるためindexPath.rowを渡す。
            
            let allTableViewCell:AllTableViewCell = segue.destination as! AllTableViewCell
            
            allTableViewCell.number = indexPath.row
            
        }

        cell.voteButton.addTarget(self, action:#selector(handleButton(sender:event:)), for:  UIControlEvents.touchUpInside)
        return UITableViewCell()
    }
        func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            // Auto Layoutを使ってセルの高さを動的に変更する
            return UITableViewAutomaticDimension

    }
       }

   


// MARK: - UITableViewDelegate
extension AllViewController: UITableViewDelegate {
    
}
