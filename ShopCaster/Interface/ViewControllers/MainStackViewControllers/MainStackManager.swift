//
//  MainStackManager.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 7/25/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

// MARK: - Main Stack Setup
fileprivate struct ChildViewControllers {
    let homeChildController: MainStackChild = {
        let this = homeViewController(); this.view.backgroundColor = .white;
        this.navigationController?.navigationItem.titleView = UIImageView(image: UIImage(named: "banner.png"));
//        this.navigationItem.titleView = UIImageView(image: UIImage(named: "banner.png"));
        this.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(named: "tab_bar_home@2x"),
            selectedImage: UIImage(named: "tab_bar_home@3x")
        );
        return this;
    }();
    let searchChildController: MainStackChild = {
        let this = searchViewController(); this.view.backgroundColor = .white;
        this.tabBarItem = UITabBarItem(
            title: "Search",
            image: UIImage(named: "tab_bar_search@2x"),
            selectedImage: UIImage(named: "tab_bar_search@3x")
        );
        return this;
    }();
    let contentChildController: UIViewController = {
        let this = ContentViewController(withContentSetting: .dynamicMedia);
        let img = UIImage(named: "content_tab")?.withRenderingMode(.alwaysOriginal);
        this.tabBarItem = UITabBarItem(
            title: nil,
            image: img,
            selectedImage: img
        );
        return this;
    }();
    let favoritesChildController: MainStackChild = {
        let this = favoritesViewController(); this.view.backgroundColor = .white;
        this.tabBarItem = UITabBarItem(
            title: "Favorites",
            image: UIImage(named: "tab_bar_foll@2x"),
            selectedImage: UIImage(named: "tab_bar_foll@3x")
        );
        return this;
    }();
    let accountChildController: MainStackChild = {
        let this = accountViewController(); this.view.backgroundColor = .white;
        this.tabBarItem = UITabBarItem(
            title: "Account",
            image: UIImage(named: "tab_bar_user@2x"),
            selectedImage: UIImage(named: "tab_bar_user@3x")
        );
        return this;
    }();
}

public struct MainStackConfig {
    let banner: UIImageView = {
        let this = ImageView(imagesInView: ["banner.png"], contentMode: .scaleAspectFit, backgroundColor: UIColor.clear);
        return this;
    }();
    let tabBar: TabBar = {
        let this = TabBar();
        return this;
    }();
    let activity_indicator: ProgressIndicator = {
        let this = ProgressIndicator();
        return this;
    }();
}

// MARK: - Main Stack
public class MainStackManager: UITabBarController {
    // MARK: - Stack Initialization
    var currentUser: User;
    required init(forUser: User) {
        self.currentUser = forUser;
        super.init(nibName: nil, bundle: nil);
        
        viewControllers = [
            ChildViewControllers().homeChildController,
            ChildViewControllers().searchChildController,
            ChildViewControllers().contentChildController,
            ChildViewControllers().favoritesChildController,
            ChildViewControllers().accountChildController
        ];
        print("\(#file): \(#function)");
    }
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented"); }
}

extension MainStackManager: UITabBarControllerDelegate {
    private func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("\(#file): \(#function)");
    }
}

// MARK: - Main Stack Children
open class MainStackChild: UINavigationController {
    public enum TargetSubStackController {
        case contentSubStack
        case commentSubStack
        case liveStreamSubStack
    }
    
    // MARK: - Child Navigation Methods
    open func loadSubStackController(load subStack: MainStackChild.TargetSubStackController) {
        var stackToLoad: UIViewController!;
        
        switch subStack {
        case .contentSubStack:      stackToLoad = ContentViewController(withContentSetting: .dynamicMedia);
        case .commentSubStack:      stackToLoad = CommentViewController();
        case .liveStreamSubStack:   stackToLoad = LiveStreamStackManager(userWillHost: false);
        }
        
        navigationController?.pushViewController(stackToLoad, animated: true);
        print("\(#file): \(#function)");
    }
    
    func loadUserStack(forUser user: User) {
        AppDelegate.shared.rootViewController.allocateNewInterfaceStack(
            newStack: .allocUserStack,
            withDataModel: user
        );
        print("\(#file): \(#function)");
    }
    
    func logout() {
        AppDelegate.shared.rootViewController.allocateNewInterfaceStack(
            newStack: .allocInitialStack,
            withDataModel: nil
        );
        print("\(#file): \(#function)");
    }
    
    // MARK: - Child Run Cycle
    override open func viewDidLoad() {
        super.viewDidLoad();
        delegate = self;
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        print("\(#file): \(#function)");
    }
}

// MARK: - Child Navigation
extension MainStackChild: UINavigationControllerDelegate {
    private func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        
        print("\(#file): \(#function)");
    }
    
    private func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        print("\(#file): \(#function)");
    }
}



