//
//  UserInfo.swift
//  ohgiri-app
//
//  Created by 小田倉真弘 on 2017/11/01.
//  Copyright © 2017年 masahiro.odakura. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class UserInfo: NSObject {
    var id: String?
    var name: String?
    var passward: Int?
    var mail: Any?
    //likesを押したときに追加
    var votesRecord: [String] = []
    //24時になると追加されるデータ
    var rankRecord: [Int] = []
    
    var allRecord: [Int] = []
    
    init(snapshot: DataSnapshot, myId: String) {
        self.id = snapshot.key
        
        let valueDictionary = snapshot.value as! [String: AnyObject]
        
        self.name = valueDictionary["name"] as? String
        
        self.passward = valueDictionary["passward"] as? Int
        
        self.mail = valueDictionary["mail"] as? Any
        
        self.votesRecord = valueDictionary["votesRecord"] as! [String]
        
        self.rankRecord = valueDictionary["rankRecord"] as! [Int]

        self.allRecord = valueDictionary["allRecord"] as! [Int]

    }
    

}

