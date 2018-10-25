//
//  SocialAPIModalView.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 9/13/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

public enum APITypes {
    case facebookAPI
    case googleAPI
    case twitterAPI
}

class socialAPIModalView: UIViewController {
    // MARK: - Properties
    private var rootViewController: UIViewController;
    private var APIType: APITypes?;
    private var APISessionForLogin: Bool!;
    
    private var APITitle: String;
    private var APILogoImage: UIImage!;
    private var APIColorTheme: UIColor!;
    
    // MARK: Iniialization
    required public init(for root: UIViewController!, APIType: APITypes, sessionForLogin: Bool) {
        switch APIType {
        case .facebookAPI:
            self.APITitle = "Facebook";
            self.APILogoImage = UIImage(named: "facebook-icon");
            self.APIColorTheme = UIColor.FromRGB(rgbValue: 0x4267B2);
        case .googleAPI:
            self.APITitle = "Google";
            self.APILogoImage = UIImage(named: "google-icon");
            self.APIColorTheme = UIColor.FromRGB(rgbValue: 0xDD4E41);
        case .twitterAPI:
            self.APITitle = "Twitter";
            self.APILogoImage = UIImage(named: "twitter-icon");
            self.APIColorTheme = UIColor.FromRGB(rgbValue: 0x1EA1F3);
        }
        self.rootViewController = root;
        self.APIType = APIType;
        self.APISessionForLogin = sessionForLogin;
        
        super.init(nibName: nil, bundle: nil);
        view.isOpaque = true; 
        print("\(#file): \(#function)");
    }
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented"); }
    
    let cancel_btn: Button = {
        let this = Button(
            title: "",
            titleColor: UIColor.white,
            backgroundColor: UIColor.clear,
            backgroundImage: UIImage(named: "cancel_btn"),
            animationType: .onBeganTouchPop,
            buttonTag: .cancelPressed
        );
        this.addTarget(nil, action: #selector(buttonClick), for: .touchUpInside);
        return this;
    }();
    
    var logo: UIImageView!;
    var action_btn: Button!;

    let email_field: TextField = {
        let this = TextField(
            inputStruct: FieldStructure(
                placeholder: "Email",
                tintColor: UIColor.gray,
                textColor: UIColor.black,
                backgroundColor: UIColor.FromRGB(rgbValue: 0xE8E8E8),
                textAlignment: .left,
                textPadding: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
            ),
            inputType:  .email,
            inputTag:   .emailEngaged
        );
        return this;
    }();
    let password_field: TextField = {
        let this = TextField(
            inputStruct: FieldStructure(
                placeholder: "Password",
                tintColor: UIColor.gray,
                textColor: UIColor.black,
                backgroundColor: UIColor.FromRGB(rgbValue: 0xE8E8E8),
                textAlignment: .left,
                textPadding: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
            ),
            inputType:  .password,
            inputTag:   .passwordEngaged
        );
        return this;
    }();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.title = "\(String(describing: self.APITitle)) User?";
        view.backgroundColor = APIColorTheme;
        navigationController?.navigationBar.barTintColor = self.APIColorTheme;
        navigationController?.setNavigationBarHidden(false, animated: true);
        
        self.logo = UIImageView(image: self.APILogoImage);
        
        if self.APISessionForLogin! {
            self.action_btn = Button(
                title: "Login with \(String(describing: self.APITitle))",
                titleColor: UIColor.white,
                backgroundColor: self.APIColorTheme,
                backgroundImage: nil,
                animationType: .onBeganTouchFade,
                buttonTag: .loginPressed
            );
        } else {
            self.action_btn = Button(
                title: "Register with \(String(describing: self.APITitle))",
                titleColor: UIColor.white,
                backgroundColor: self.APIColorTheme,
                backgroundImage: nil,
                animationType: .onBeganTouchFade,
                buttonTag: .registerPressed
            );
        }
        self.action_btn.addTarget(self, action: #selector(buttonClick), for: .touchUpInside);
        
        view.appendSelectSubViews(viewsToAppend:
            [logo, action_btn],
        subViewsAppended: { complete in
            logo.anchor( // Center
                top:            view.safeAreaLayoutGuide.topAnchor,
                leading:        nil,
                bottom:         nil,
                trailing:       nil,
                centerX:        view.centerXAnchor,
                centerY:        nil,
                size:           .init(width: 120, height: 120),
                padding:        .init(top: 0, left: 0, bottom: 0, right: 0)
            );

            action_btn.anchor( // Bottom
                top:            nil,
                leading:        view.safeAreaLayoutGuide.leadingAnchor,
                bottom:         view.safeAreaLayoutGuide.bottomAnchor,
                trailing:       view.safeAreaLayoutGuide.trailingAnchor,
                centerX:        nil,
                centerY:        nil,
                size:           .init(width: view.frame.width, height: 45),
                padding:        .init(top: 0, left: 10, bottom: 240, right: 10)
            );
            
            [email_field, password_field].forEach {
                $0.setTextFieldLayer(cornerRadius: 5, borderColor: self.APIColorTheme);
                $0.delegate = self;
                view.addSubview($0);
            }
            
            email_field.anchor(
                top:            logo.bottomAnchor,
                leading:        view.safeAreaLayoutGuide.leadingAnchor,
                bottom:         nil,
                trailing:       view.safeAreaLayoutGuide.trailingAnchor,
                centerX:        nil,
                centerY:        nil,
                size:           .init(width: view.frame.width, height: 35),
                padding:        .init(top: 50, left: 10, bottom:  15, right: 10)
            );
            
            password_field.anchor(
                top:            email_field.bottomAnchor,
                leading:        email_field.leadingAnchor,
                bottom:         nil,
                trailing:       email_field.trailingAnchor,
                centerX:        nil,
                centerY:        nil,
                size:           .init(width: view.frame.width, height: 35),
                padding:        .init(top: 15, left: 0, bottom: 5, right: 0)
            );
        });
    }
    
    // MARK: - Event Handlers
    func buttonClick(sender: Button) {
        switch sender.buttonTag {
        case .loginPressed:     break;
        case .registerPressed:  break;
        case .cancelPressed:
            dismiss(animated: true, completion: nil);
        default:
            break;
        }
        
        print("\(#file): \(#function)");
    }
}

extension socialAPIModalView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true;
    }
}
