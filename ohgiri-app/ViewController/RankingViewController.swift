//
//  RankingViewController.swift
//  
//
//  Created by 小田倉真弘 on 2017/10/26.
//
//

import UIKit

class RankingViewController: UIViewController {

    @IBOutlet weak var rankingTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        rankingTableView.delegate=self
        rankingTableView.dataSource=self
        // Do any additional setup after loading the view.
        rankingTableView.allowsSelection = false

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
extension RankingViewController: UITableViewDataSource {
    
    /// セルの数
    ///
    /// - Parameters:
    ///   - tableView: UITableView
    ///   - section: Int
    /// - Returns: セル数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: 後ほどしっかり組む
        return 0
    }
    
    /// セルの設定
    ///
    /// - Parameters:
    ///   - tableView: UITableView
    ///   - indexPath: IndexPath
    /// - Returns: セル
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: 後ほどしっかり組む
        return UITableViewCell()
    }
}

// MARK: - UITableViewDelegate
extension RankingViewController: UITableViewDelegate {
    
}

