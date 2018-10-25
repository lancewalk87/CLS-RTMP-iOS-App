//
//  datasets.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 8/3/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

extension String {
    // MARK: - Setters
    func containsDisregardCase(find: String) -> Bool {
        return self.range(of: find, options: .caseInsensitive) != nil;
    }
    
//    func attributedComment() -> NSAttributedString {
//        let attrs = TextAttributes()
//            .font(UIFont.defaultFont(size: 13))
//            .foregroundColor(UIColor.white)
//            .alignment(.left)
//            .lineSpacing(1)
//            .dictionary
//        return NSAttributedString(string: self, attributes: attrs)
//    }

    // MARK: - Getters
    public var isValidEmail: Bool {
        let i = ["@", ".com"];
        for (_, x) in i.enumerated() {
            if (!self.contains(x)) { return false; }
        }
        return true;
    }
    
    public var isValidPassword: Bool {
        return true;
    }
}
