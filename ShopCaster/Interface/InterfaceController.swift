//
//  InterfaceController.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 9/12/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

// MARK: - Interface Controller Setup
fileprivate class InterfaceLoader: UIViewController {
    private let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge);
    
    override func viewDidLoad() {
        super.viewDidLoad();
        view.backgroundColor = UIColor.white;
        
        view.addSubview(activityIndicator);
        
        activityIndicator.frame = view.bounds;
        activityIndicator.backgroundColor = UIColor(white: 0, alpha: 0.4);
        
        makeServiceCall();
        print("\(#file): \(#function)");
    }
    
    private func makeServiceCall() {
        activityIndicator.startAnimating();
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(1)) {
            self.activityIndicator.stopAnimating();
            let uc = User();
            AppDelegate.shared.rootViewController.allocateNewInterfaceStack(
                newStack: .allocMainStack,
                withDataModel: uc
            );
        }
    }
}

// MARK: - Interface Controller
class InterfaceController: UIViewController {
    // MARK: Initialization
    var allocatedInterfaceStack: UIViewController;
    init() {
        self.allocatedInterfaceStack = InterfaceLoader();
        super.init(nibName: nil, bundle: nil);
        handleStackAllocation(newInterface: allocatedInterfaceStack);
    }
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented"); }
    
    // MARK: - Stack Methods
    public enum InterfaceStacks {
        case allocInitialStack
        case allocMainStack
        case allocUserStack
    }
    
    func allocateNewInterfaceStack(newStack: InterfaceStacks, withDataModel user: User?) {
        var interfaceStack: UIViewController;
        switch newStack {
        case .allocInitialStack:    interfaceStack = InitialStackManager();
        case .allocMainStack:       interfaceStack = MainStackManager(forUser: user!);
        case .allocUserStack:       interfaceStack = UserStackManager(forUser: user!);
        }
        handleStackAllocation(newInterface: interfaceStack);
        print("\(#file): \(#function)");
    }
    
    // MARK: - Transistion Handlers
    private func handleStackAllocation(newInterface: UIViewController) {
        addChildViewController(newInterface);
        newInterface.view.frame = view.bounds;
        view.addSubview(newInterface.view);
        newInterface.didMove(toParentViewController: self);
    
        // deallocate current:
        handleStackDeallocation(completion: { (delocComplete) in
            self.allocatedInterfaceStack = newInterface;
        });
        
        print("\(#file): \(#function)");
    }

    private func handleStackDeallocation(completion: (Bool) -> Void) {
        allocatedInterfaceStack.willMove(toParentViewController: nil);
        allocatedInterfaceStack.view.removeFromSuperview();
        allocatedInterfaceStack.removeFromParentViewController();
        
        print("\(#file): \(#function)");
        completion(true);
    }
}

