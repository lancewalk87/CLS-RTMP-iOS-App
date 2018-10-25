//
//  ContentViewController.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 7/22/18.
//  Copyright © 2018 ShopCaster. All rights reserved.
//

// MARK: - Content Stack Setup

// MARK: - Content Stack
public class ContentStackManager: UIViewController {
    public enum ContentSettings {
        case staticMedia
        case dynamicMedia
    }
    var contentSettings: ContentSettings;
    required public init(withContentSetting: ContentSettings) {
        self.contentSettings = withContentSetting;
        super.init(nibName: nil, bundle: nil);
        print("\(#file): \(#function)");
    }
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented"); }
}

extension ContentStackManager: UINavigationControllerDelegate {
    
}
