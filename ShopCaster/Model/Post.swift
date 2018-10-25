//
//  File.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 8/29/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

class Post {
//    var name: String?
//    var profileImageName: String?
//    var statusText: String?
//    var statusImageName: String?
//    var numLikes: NSNumber?
//    var numComments: NSNumber?
//
    var caption: String?
    var photoURL: String?
    var uid: String?
    var id: String?
    var likeCount: Int?
    var likes: Dictionary<String, Any>?
    var isLiked: Bool?
    
//    var location: Location?
//
//    override func setValue(_ value: Any?, forKey key: String) {
//        if key == "location" {
//            location = Location()
//            location?.setValuesForKeys(value as! [String: AnyObject])
//        } else {
//            super.setValue(value, forKey: key)
//        }
//    }
}

//class SafeJsonObject: NSObject {
//
//    override func setValue(_ value: Any?, forKey key: String) {
//        let selectorString = "set\(key.uppercased().characters.first!)\(String(key.characters.dropFirst())):"
//        let selector = Selector(selectorString)
//        if responds(to: selector) {
//            super.setValue(value, forKey: key)
//        }
//    }
//
//}
//
//class Location: NSObject {
//    var city: String?
//    var state: String?
//}
