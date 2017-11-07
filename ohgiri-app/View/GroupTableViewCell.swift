//
//  GroupTableViewCell.swift
//
//
//  Created by 小田倉真弘 on 2017/10/27.
//
//

import UIKit
import Firebase
import FirebaseDatabase


class GroupTableViewCell: UITableViewCell {
    
    @IBOutlet weak var odaiImageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bokeLabel: UILabel!
    @IBOutlet weak var voteButton: UIButton!
    @IBOutlet weak var votesLabel: UILabel!
    //votesにユーザーidを追加して投票したか確認する
    var votes:[String] = [""]
        override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    @IBAction func likeButton(_ sender: Any) {
        //votesにユーザーidを追加して投票したか確認する
        func setUserInfo(userInfo: UserInfo){
            votes.append(userInfo.id!)
            
        }
        //もし自分のIDがあればlikebuttonを無効にする
        
        
    }
    func setBokeData(bokeData: BokeData){
        //imageViewとnumberは後回し
        self.bokeLabel.text="\(bokeData.boke!)"
        self.nameLabel.text="\(bokeData.name!)"
        let likeNumber = bokeData.likes.count
        votesLabel.text = "\(likeNumber)"
        if bokeData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.voteButton.setImage(buttonImage, for: UIControlState.normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.voteButton.setImage(buttonImage, for: UIControlState.normal)
        }
    }
    
}
