//
//  GroupPostViewController.swift
//  
//
//  Created by 小田倉真弘 on 2017/10/26.
//
//

import UIKit

class GroupPostViewController: UIViewController {

    @IBOutlet weak var odaiImageView: UIImageView!
    @IBOutlet weak var bokeTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func postButton(_ sender: Any){
    
         self.dismiss(animated: true, completion: nil)
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
