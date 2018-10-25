//
//  LiveStreamStackManager.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 9/24/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

// MARK: - LiveStream Stack Protocol
protocol LiveStreamHostDelegate: NSObjectProtocol {
    func claims(streamClient: User, didRequestClaim ofItem: Item)
}

protocol LiveStreamClientDelegate: NSObjectProtocol {
    func claims(streamHost: User, didApproveClaim ofItem: Item)
    func claims(streamHost: User, didRejectClaim ofItem: Item)
}

// MARK: - LiveStream Stack
public class LiveStreamStackManager: UINavigationController {
    var isUserHosting: Bool;
    
    required init(userWillHost: Bool) {
        var initForType: UIViewController!;
        if (userWillHost) {
            initForType = stramHostViewController()
        } else { initForType = streamClientViewController(); }
        self.isUserHosting = userWillHost;
        super.init(rootViewController: initForType);
        
        delegate = self;
        print("\(#file): \(#function)");
    }
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented"); }
}

extension LiveStreamStackManager: UINavigationControllerDelegate {
    private func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        print("\(#file): \(#function)");
    }
    
    private func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        print("\(#file): \(#function)");
    }
}

// MARK: - LiveStream Stack Children
open class LiveStreamStackChild: UIViewController {
    override open func viewDidLoad() {
        super.viewDidLoad();
        
        print("\(#file): \(#function)");
    }
}

// MARK: - Client ViewController
class streamClientViewController: LiveStreamStackChild {
    // MARK: - Setup
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        print("\(#file): \(#function)");
    }
}

extension streamClientViewController: LiveStreamClientDelegate {
    func claims(streamHost: User, didApproveClaim ofItem: Item) {
        print("\(#file): \(#function)");
    }
    
    func claims(streamHost: User, didRejectClaim ofItem: Item) {
        print("\(#file): \(#function)");
    }
}

// MARK: - Host ViewController 
class stramHostViewController: LiveStreamStackChild {
    // MARK: - Setup
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        print("\(#file): \(#function)");
    }
}

extension stramHostViewController: LiveStreamHostDelegate {
    func claims(streamClient: User, didRequestClaim ofItem: Item) {
        print("\(#file): \(#function)");
    }
}

