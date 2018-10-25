//
//  AppDelegate.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 9/12/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?;
    
    // MARK: - Application Run Cycle
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Interface:
        window = UIWindow(frame: UIScreen.main.bounds);
        window?.rootViewController = InterfaceController();
        window?.makeKeyAndVisible();
        
        // Backend:
//        let configuration = ParseClientConfiguration {
//            $0.applicationId = "lkpSHHcMUM5GH52tz1djFlbCE3cWi5FCjWjIncWC"
//            $0.clientKey = "TgonK02GFWWIvoBbu1AoI9Y3uQJ3dPWfNnkeEPaZ"
//            $0.server = "https://parseapi.back4app.com"
//        }
//        Parse.initialize(with: configuration)

        print("\(#file): \(#function)");
        return true;
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
//        DeepLinkService.checkDeepLink();
        
        print("\(#file): \(#function)");
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
//        completionHandler(DeepLinkService.handleShortcut(item: shortcutItem));
        print("\(#file): \(#function)");
    }
}

extension AppDelegate {
    static var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate;
    }
    
    var rootViewController: InterfaceController {
        return window!.rootViewController as! InterfaceController;
    }
}
