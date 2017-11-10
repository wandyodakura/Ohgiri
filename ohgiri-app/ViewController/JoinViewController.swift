//
//  JoinViewController.swift
//  ohgiri-app
//
//  Created by 小田倉真弘 on 2017/11/08.
//  Copyright © 2017年 masahiro.odakura. All rights reserved.
//

import UIKit
import Firebase



class JoinViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var joinTableView: UITableView!
    
    var groupArray: [GroupInfo] = []
    var searchResults:[String] = []
    var groupInfo: GroupInfo?
    var tableGroupArray: [GroupInfo]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初期表示はgroupArray全部うつす。
        tableGroupArray = groupArray
        joinTableView.delegate=self
        //意味不（as以降）
        joinTableView.dataSource=self
        searchBar.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("\(String(describing: searchBar.text))")
        tableGroupArray=groupArray.filter{
            ($0.name ?? "").contains(searchBar.text ?? "")
        }
        
        joinTableView.reloadData()
        searchBar.showsCancelButton = true
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableGroupArray.count
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
        
        searchBar.text=""
        joinTableView.reloadData()
        
    }
    func joinTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // MEMO:
        // groupArrayの数を返したいはずなので、groupArray.countとすればOKです
        return groupArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // MEMO:
        // ここはエラーを回避するためにとりあえず書いてあるという状態なので、適切に書き換える必要があります
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "passward",sender: indexPath)
    }
    @IBAction func joinUnwind(_ segue: UIStoryboardSegue) {
        
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
