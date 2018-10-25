//
//  AuthService.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 9/19/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

class AuthService {
    // MARK: - Methods
    static func login(email: String, password: String, onSuccess: @escaping (_ userModel: User) -> Void, onError: @escaping (_ errorMessage: String?) -> Void) {
        let test = User();
        onSuccess(test);
    }
    
    static func register(userData: Dictionary<String, Any>, onSuccess: @escaping () -> Void, onError: @escaping (_ errorMessage: String?) -> Void) {
        
    }
    
    static func logout(onSuccess: @escaping () -> Void, onError: @escaping (_ errorMessage: String?) -> Void) {
        
    }
}
