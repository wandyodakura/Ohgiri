//
//  OdaiData.swift
//  ohgiri-app
//
//  Created by 小田倉真弘 on 2017/11/01.
//  Copyright © 2017年 masahiro.odakura. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class OdaiData: NSObject {
    var id: String?
    var image: UIImage?
    var imageString: String?
    var bokes: [String] = []
    var date: NSDate?
    var userId : String?
        init(snapshot: DataSnapshot, myId: String) {
        self.id = snapshot.key
        
        let valueDictionary = snapshot.value as! [String: AnyObject]
        
        imageString = valueDictionary["image"] as? String
        image = UIImage(data: NSData(base64Encoded: imageString!, options: .ignoreUnknownCharacters)! as Data)
        
        if let bokes = valueDictionary["bokes"] as? [String] {
            self.bokes = bokes
        }
        
        let time = valueDictionary["time"] as? String
        self.date = NSDate(timeIntervalSinceReferenceDate: TimeInterval(time!)!)
        
        self.userId = valueDictionary["userId"] as? String
        //valuedictionalyのあたりは適当だからあとで検討する
        
        
        
    }
    
}


