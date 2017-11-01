//
//  BokeData.swift
//  
//
//  Created by 小田倉真弘 on 2017/10/28.
//
//

import UIKit
import Firebase
import FirebaseDatabase

class BokeData: NSObject {
    var id: String?
    var odai: UIImage?
    var odaiString: String?
    var name: String?
    var boke: String?
    var date: NSDate?
    var likes: [String] = []
    var isLiked: Bool = false
    
    init(snapshot: DataSnapshot, myId: String) {
        self.id = snapshot.key
        
        let valueDictionary = snapshot.value as! [String: AnyObject]
        
        odaiString = valueDictionary["odai"] as? String
        odai = UIImage(data: NSData(base64Encoded: odaiString!, options: .ignoreUnknownCharacters)! as Data)
        
        self.name = valueDictionary["name"] as? String
        
        self.boke = valueDictionary["boke"] as? String
        
        let time = valueDictionary["time"] as? String
        self.date = NSDate(timeIntervalSinceReferenceDate: TimeInterval(time!)!)
        
        if let likes = valueDictionary["likes"] as? [String] {
            self.likes = likes
        }
        
        for likeId in self.likes {
            if likeId == myId {
                self.isLiked = true
                break
            }
        }
    }

}
