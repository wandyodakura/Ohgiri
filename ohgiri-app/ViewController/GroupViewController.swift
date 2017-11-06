//
//  GroupViewController.swift
//  
//
//  Created by 小田倉真弘 on 2017/10/26.
//
//

import UIKit

class GroupViewController: UIViewController {

    @IBOutlet weak var groupTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        groupTableView.delegate=self
        groupTableView.dataSource=self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    @IBAction func groupUnwind(_ segue: UIStoryboardSegue) { }

    

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
extension GroupViewController: UITableViewDelegate {
    
}

