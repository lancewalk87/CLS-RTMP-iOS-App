//
//  SocialSubController.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 9/13/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

class socialSubController {
    enum APITypes {
        case facebookAPI
        case googleAPI
    }
    private var APIType: APITypes?;
    
    required public init(forAPI: APITypes) {
        self.APIType = forAPI;
        // initilaioze sign in :
        print("\(#file): \(#function)");
    }
}
