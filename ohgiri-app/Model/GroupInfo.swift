//
//  GroupInfo.swift
//  ohgiri-app
//
//  Created by 小田倉真弘 on 2017/11/01.
//  Copyright © 2017年 masahiro.odakura. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class GroupInfo: NSObject {
    var id: String?
    var users: String?
    var name: String?

    init(snapshot: DataSnapshot, myId: String) {
        self.id = snapshot.key
        
        let valueDictionary = snapshot.value as! [String: AnyObject]
        
        self.name = valueDictionary["name"] as? String
        
        self.users = valueDictionary["users"] as? String
    }

}

