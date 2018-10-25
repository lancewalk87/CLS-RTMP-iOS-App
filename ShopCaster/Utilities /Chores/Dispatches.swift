//
//  Dispatches.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 8/29/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

open class Dispatches: NSObject {
    public func asynchAfter(interval: Int?, dispatched: (Bool)->()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            
        }
    }
}
