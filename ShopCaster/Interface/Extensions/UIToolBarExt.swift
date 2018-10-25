//
//  UIToolBarExt.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 9/7/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

extension UIToolbar {
    public func configToolBarForPicker(select: Selector) -> UIToolbar {
        let toolBar = UIToolbar();
        toolBar.barStyle = UIBarStyle.default;
        toolBar.isTranslucent = true;
        toolBar.tintColor = UIColor.black;
        toolBar.sizeToFit();
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: select)
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        toolBar.setItems([ spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        return toolBar
    }
}
