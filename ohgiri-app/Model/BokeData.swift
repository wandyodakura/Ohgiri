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
    var name: String?
    var boke: String?
    var date: NSDate?
    var likes: [String] = []
    var heits: [String] = []
    var isLiked: Bool = false
    var isHeited: Bool = false
    
    init(snapshot: DataSnapshot, myId: String) {
        self.id = snapshot.key
        
        let valueDictionary = snapshot.value as! [String: AnyObject]
        
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
        if let heits = valueDictionary["heits"] as? [String] {
            self.heits = heits
        }
        
        for heitId in self.heits {
            if heitId == myId {
                self.isHeited = true
                break
            }
        }

    }

    override init() {
        super.init()
    }
    
    /// こういう風に書くModelクラスで適当に定義しておく
    ///
    /// - Returns: [BokeData]
    static func getDebugList() -> [BokeData] {
        var result: [BokeData] = []
        
        for i in 1..<11 {
            let value = BokeData()
            value.id = String(i)
            /*
             他に仮としてデータ突っ込んでみる
            */
            
            result.append(value)
        }
        
        return result
    }
}
