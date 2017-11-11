//
//  RankingTableViewCell.swift
//  ohgiri-app
//
//  Created by 小田倉真弘 on 2017/10/27.
//  Copyright © 2017年 masahiro.odakura. All rights reserved.
//

import UIKit

class RankingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    var votes: Int?
    var userInfo: UserInfo?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setUserInfo(userInfo: UserInfo){
        self.votesLabel.text="\(votes)"
        if votes == nil {
            votesLabel.text = nil
        }
        self.nameLabel.text="\(userInfo.name)"
    }
    
}


