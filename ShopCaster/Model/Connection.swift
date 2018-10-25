//
//  People.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 9/8/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

public enum UserStatus {
    case loggedIn
    case loggedOut
    case live
}

class Connection {
    struct basic {
        var profileImg: UIImage?;
        var status: UserStatus?;
        var connections: Int?;
        var ranking: Float?;
    }
    
    struct detailed {
        var basic: basic;
        var isSeller: Bool?;
        var posts: Int?;
        var sales: Int?;
        var categories: Array<String>?;
    }
}

extension Connection {
    
}
