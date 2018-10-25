//
//  ContentViewController.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 7/22/18.
//  Copyright © 2018 ShopCaster. All rights reserved.
//

// MARK: - Content Stack Setup

// MARK: - Content Stack
public class ContentViewController: UIViewController {
    // MARK: - Elements
    let modules_btn: Button = {
        let this = Button(
            title: "",
            titleColor: UIColor.white,
            backgroundColor: UIColor.clear,
            backgroundImage: UIImage(named: ""),
            animationType: .onBeganTouchPop,
            buttonTag: .profilePressed
        );
        return this;
    }();
    let modules_view: UIScrollView = {
        let this = UIScrollView();
        return this;
    }();
    
    let content_toolbar: UIScrollView = {
        let this = UIScrollView();
        return this;
    }();
    
    public enum ContentSettings {
        case staticMedia
        case dynamicMedia
    }
    
    // MARK: - Initialization
    var contentSettings: ContentSettings;
    required public init(withContentSetting: ContentSettings) {
        self.contentSettings = withContentSetting;
        super.init(nibName: nil, bundle: nil);
        print("\(#file): \(#function)");
    }
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented"); }

    // MARK: - Setup
    override public func viewDidLoad() {
        super.viewDidLoad();
        view.backgroundColor = .white;
        
        print("\(#file): \(#function)");
    }
}

// MARK: - Collection View Delegate

// MARK: - User Media Library
extension ContentViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
}
