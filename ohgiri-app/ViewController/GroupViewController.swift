//
//  GroupViewController.swift
//
//
//  Created by 小田倉真弘 on 2017/10/26.
//
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class GroupViewController: UIViewController {
    
    @IBOutlet weak var groupTableView: UITableView!
    
    var timer: Timer!
    
    var bokeArray: [BokeData] = []
    var votes:[String] = [""]
    var userInfo: UserInfo?
    var groupInfo: GroupInfo?
    var odaiBox: odaiBox?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        groupTableView.delegate=self
        groupTableView.dataSource=self
        // Do any additional setup after loading the view.
        groupTableView.allowsSelection = false
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //タイマーはサーバーにもたせたい　今は仮
        timer = Timer.scheduledTimer(timeInterval: 86400.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        timer.fire()
        //likesの多い順に並べる
        bokeArray.sort { $0.likes.count > $1.likes.count }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        timer.invalidate()
    }
    
    func update(tm: Timer) {
        // do something
        //お題を変えて、ボケをリセットfor文とか
        let groupTableViewCell = GroupTableViewCell()
        groupTableViewCell.bokeData = nil
        groupTableViewCell.number = nil
        
        self.groupTableView.reloadData()
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //もしグループに入ってなければJoinVCを表示する
        if groupInfo?.users == nil {
            DispatchQueue.main.async {
                let joinViewController = self.storyboard?.instantiateViewController(withIdentifier: "Join")
                self.present(joinViewController!, animated: true, completion: nil)
            }
        }
        
    }
    func handleButton(sender: UIButton, event:UIEvent){
        print("DEBUG_PRINT: likeボタンがタップされました。")
        
        // タップされたセルのインデックスを求める
        let touch = event.allTouches?.first
        let point = touch!.location(in: self.groupTableView)
        let indexPath = groupTableView.indexPathForRow(at: point)
        
        // 配列からタップされたインデックスのデータを取り出す
        let bokeData = bokeArray[indexPath!.row]
        
        let myId = userInfo?.id
        votes.append(myId!)
        
        
        
        if votes.contains("myId") {
            
            sender.isEnabled = false
            
            print("DEBUG_PRINT:　投票は一つまでです。")
            
        }
        
        // Firebaseに保存するデータの準備
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
    
    @IBAction func allPostButton(_ sender: Any) {
        
    }
    
    @IBAction func groupUnwind(_ segue: UIStoryboardSegue) {
        
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
extension GroupViewController: UITableViewDataSource {
    
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
            let groupTableViewCell:GroupTableViewCell = segue.destination as! GroupTableViewCell
            
            groupTableViewCell.number = indexPath.row
            
        }
        
        
        
        
        // セル内のボタンのアクションをソースコードで設定する
        cell.voteButton.addTarget(self, action:#selector(handleButton(sender:event:)), for:  UIControlEvents.touchUpInside)
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        // Auto Layoutを使ってセルの高さを動的に変更する
        return UITableViewAutomaticDimension
    }
}

// MARK: - UITableViewDelegate
extension GroupViewController: UITableViewDelegate {
    
}

