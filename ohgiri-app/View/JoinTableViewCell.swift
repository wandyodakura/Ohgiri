//
//  JoinTableViewCell.swift
//  ohgiri-app
//
//  Created by 小田倉真弘 on 2017/11/08.
//  Copyright © 2017年 masahiro.odakura. All rights reserved.
//

import UIKit

class JoinTableViewCell: UITableViewCell {

    @IBOutlet weak var groupNameLabel: UILabel!
    
    @IBOutlet weak var readerNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setGroupInfo(groupInfo: GroupInfo){
        self.groupNameLabel.text = "\(groupInfo.name!)"
        self.readerNameLabel.text = "\(groupInfo.readerName!)"
        }
       }
