//
//  PostedTableViewCell.swift
//  
//
//  Created by 小田倉真弘 on 2017/10/27.
//
//

import UIKit

class PostedTableViewCell: UITableViewCell {

    @IBOutlet weak var odaiImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bokeLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    


    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setBokeData(bokeData: BokeData){
    //imageViewは後回し
        self.bokeLabel.text="\(bokeData.boke!)"
        self.nameLabel.text="\(bokeData.name!)"
        let likeNumber = bokeData.likes.count
        likesLabel.text = "\(likeNumber)"
            }
    
    
    
    
}
