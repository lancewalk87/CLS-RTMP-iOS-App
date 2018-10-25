//
//  InitialStackManager.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 8/31/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

// MARK: - Initial Stack Setup
fileprivate struct ChildViewControllers {
    let landingChildController: InitialStackChild = { return landingViewController(); }();
    let registerChildController: InitialStackChild = {
        let this = registerViewController(); this.title = "Register";
        this.navigationItem.leftBarButtonItem = InitialStackConfig().homeBtn;
        return this;
    }();
    let loginChildController: InitialStackChild = {
        let this = loginViewController(); this.title = "Login";
        this.navigationItem.leftBarButtonItem = InitialStackConfig().homeBtn;
        return this;
    }();
}

public struct InitialStackConfig {
    let banner: UIImageView = {
        let this = ImageView(imagesInView: ["banner-main.png"], contentMode: .scaleAspectFit, backgroundColor: UIColor.clear);
        return this;
    }();
    let homeBtn: UIBarButtonItem = {
        let this = Button(
            title: "",
            titleColor: UIColor.white,
            backgroundColor: UIColor.clear,
            backgroundImage: UIImage(named: "navbar_ic_back@3x.png"),
            animationType: .onBeganTouchPop,
            buttonTag: .returnPressed
        );
        this.addTarget(nil, action: #selector(InitialStackManager.presentRootViewController), for: .touchUpInside);
        return UIBarButtonItem(customView: this);
    }();
    
    let outputLabel: Label = {
        let this = Label(
            labelStyle: .none, text: "",
            titleColor: UIColor.red,
            backgroundColor: UIColor.clear
        );
        return this;
    }();
    let footerLabel: Label = {
        let this = Label(
            labelStyle: .none,
            text: "Copyright © 2018 Shopcaster. All rights reserved.",
            titleColor: UIColor.black,
            backgroundColor: UIColor.clear
        );
        return this;
    }();
    // Modal Btns
    let facebook_btn: Button = {
        let this = Button(
            title: "Facebook",
            titleColor: UIColor.white,
            backgroundColor: UIColor.FromRGB(rgbValue: 0x3B5998),
            backgroundImage: nil,
            animationType: .onBeganTouchPop,
            buttonTag: .facebookPressed
        );
        this.setButtonLayer(cornerRadius: 5, borderColor: UIColor.clear);
        return this;
    }();
    let google_btn: Button = {
        let this = Button(
            title: "Google",
            titleColor: UIColor.white,
            backgroundColor: UIColor.FromRGB(rgbValue: 0xE02F2F),
            backgroundImage: nil,
            animationType: .onBeganTouchPop,
            buttonTag: .googlePressed
        );
        this.setButtonLayer(cornerRadius: 5, borderColor: UIColor.clear);
        return this;
    }();
}

// MARK: - Initial Stack
public class InitialStackManager: UINavigationController {
    // MARK: - Stack Initialization
    required init() {
        super.init(rootViewController: ChildViewControllers().landingChildController);
        delegate = self;
        setNavigationBarHidden(true, animated: false);
        
        let label = InitialStackConfig().footerLabel;
        label.frame = CGRect(x: 0, y: 0, width: toolbar.frame.width, height: toolbar.frame.height);
        toolbar.addSubview(label);
        setToolbarHidden(false, animated: false);
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)) {
            self.setToolbarHidden(true, animated: true);
        }
        print("\(#file): \(#function)");
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil);
    }
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented"); }
    
    // MARK: Navigation Methods
    public func presentRootViewController() {
        setNavigationBarHidden(true, animated: true);
        popToRootViewController(animated: true);
    }
}

extension InitialStackManager: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        print("\(#file): \(#function) viewController: \(viewController)");
    }
}

// MARK: - Initial Stack Children
open class InitialStackChild: UIViewController {
    var inputFeildConstraint: NSLayoutYAxisAnchor?;
    
    public enum TargetChildViewController {
        case registerViewController
        case loginViewController
        case contentViewController
    }
    
    public enum TargetModalViewController {
        case socialAPIModalView(type: APITypes, isForLogin: Bool)
        case passwordModalView(email: String)
    }
    
    // MARK: - Child Navigation Methods
    open func loadChildViewController(to child: InitialStackChild.TargetChildViewController) {
        navigationController?.setNavigationBarHidden(false, animated: true);
        switch child {
        case .registerViewController:
            navigationController?.pushViewController(
                ChildViewControllers().registerChildController,
                animated: true
            );
        case .loginViewController:
            navigationController?.pushViewController(
                ChildViewControllers().loginChildController,
                animated: true
            );
        case .contentViewController:
            present(
                ContentViewController(withContentSetting: .staticMedia),
                animated: true,
                completion: nil
            );
        }
        print("\(#file): \(#function)");
    }
    
    open func loadModalViewController(to modal: InitialStackChild.TargetModalViewController) {
        switch modal {
        case .socialAPIModalView(let type, let isForLogin):
            present(
                socialAPIModalView(for: self, APIType: type, sessionForLogin: isForLogin),
                animated: true,
                completion: nil
            );
            break;
        case .passwordModalView(let email):
            present(
                passwordModalView(for: self, entryEmail: email),
                animated: true,
                completion: nil
            );
        }
        print("\(#file): \(#function)");
    }
    
    open func throwFormError(withMsg: String?) {
        print("\(#file): \(#function)");
    }

    // MARK: - Child Run Cycle
    override open func viewDidLoad() {
        super.viewDidLoad();
        view.backgroundColor = .white;
        
        NotificationCenter.default.addObserver(self,
            selector: #selector(keyboardWillShow(_:)),
            name: .UIKeyboardDidShow, object: nil
        );
        
        NotificationCenter.default.addObserver(self,
            selector: #selector(keyboardWillHide(_:)),
            name: .UIKeyboardWillHide, object: nil
        );
    }
    
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        print("\(#file): \(#function)");
    }
}

extension InitialStackChild {
    // MARK: - Child Interface Methods
    func keyboardWillShow(_ notification: NSNotification) {
//        let keyboardFrame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue
//        UIView.animate(withDuration: 0.3) {
//            self.inputFeildConstraint = keyboardFrame!.height;
//            self.view.layoutIfNeeded()
//        }
        print("\(#file): \(#function)");
    }
    
    func keyboardWillHide(_ notification: NSNotification) {
//        UIView.animate(withDuration: 0.3) {
//            self.inputFeildConstraint = 0;
//            self.view.layoutIfNeeded()
//        }
        print("\(#file): \(#function)");
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true);
    }
}
