//
//  AllViewController.swift
//  
//
//  Created by 小田倉真弘 on 2017/10/26.
//
//

import UIKit

class AllViewController: UIViewController {

    @IBOutlet weak var allTableView: UITableView!

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
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        timer.invalidate()
    }
    
    func update(tm: Timer) {
        // do something
        
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
extension AllViewController: UITableViewDelegate {
    
}
