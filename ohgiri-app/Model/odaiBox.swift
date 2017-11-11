//
//  odaiBox.swift
//  ohgiri-app
//
//  Created by 小田倉真弘 on 2017/11/09.
//  Copyright © 2017年 masahiro.odakura. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class odaiBox: NSObject {

    var odai: [String?] = []

    
 
    
    var id: String?
    
    
    init(snapshot: DataSnapshot, myId: String){
        self.id = snapshot.key
        let valueDictionary = snapshot.value as! [String: AnyObject]

        self.odai = (valueDictionary["odai"] as? [String])!
        var index: Int = 0
        
            
        
    }
}
