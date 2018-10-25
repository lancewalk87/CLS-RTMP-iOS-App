//
//  UserStackManager.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 7/25/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//


// MARK: - User Stack Setup
fileprivate struct ChildViewControllers {

}

// MARK: - User Stack
private class tabMenu: UIView {
    let menu_view: UICollectionView = {
        let layout = UICollectionViewFlowLayout();
        let this = UICollectionView(frame: .zero, collectionViewLayout: layout);
        this.backgroundColor = .white;
        return this;
    }();
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        addSubview(menu_view);
    }
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented"); }
}

//extension tabMenu: UICollectionViewDataSource {
//
//}

public class UserStackManager: UITabBarController {
    // MARK: - Stack Initialization
    var selectedUser: User;
    required init(forUser: User) {
        self.selectedUser = forUser;
        super.init(nibName: nil, bundle: nil);
        print("\(#file): \(#function)");
    }
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented"); }
}

// MARK: - User Stack Children
open class UserStackChild: UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad();
    }
}
