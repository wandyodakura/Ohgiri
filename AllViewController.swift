//
//  AllViewController.swift
//  
//
//  Created by 小田倉真弘 on 2017/10/26.
//
//

import UIKit

class AllViewController: UIViewController, UITableViewDelegate, UITableViewDatasource {

    @IBOutlet weak var allTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate=self
        tableView.dataSource=self

        // Do any additional setup after loading the view.
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
