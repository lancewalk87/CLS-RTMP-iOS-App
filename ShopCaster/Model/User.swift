//
//  User.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 8/29/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

class User: NSObject {
    var fullName: String?;
    var birthDate: String?;
    var address: String?;
    var city: String?;
    var state: String?;
    var postCode: Int?;
    var email: String?;
    var profileImgURL: String?;
}

extension User {
    static func transformUser(postDictionary: [Any]) -> User {
        let user = User();
        
        return user;
    }
}




//var err: Bool = false;
//
//public class User {
//    public struct modelProperties {
//        var userName: String;
//        var birthDate: String;
//        var adddress: String;
//        var city: String;
//        var state: String;
//        var postCode: Int;
//        var email: String;
//    }
//    var userProperties: modelProperties;
//
//    // MARK: - Initializers
//    init(properties: modelProperties) { self.userProperties = properties; }
//
//    deinit {
////        CLongLong
//    }
//}
//
//extension User {
////    static func transformUser(postDictionary: [String: Any]) -> User {
////        let user = User();
////        user.email = postDictionary["email"] as? String;
////        user.profileImageURL = postDictionary["profileImageURL"] as? String;
////        user.username = postDictionary["username"] as? String;
////        return user;
////    }
//}


