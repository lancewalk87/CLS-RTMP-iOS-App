//
//  LoginViewController.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 7/22/18.
//  Copyright © 2018 ShopCaster. All rights reserved.
//

class loginViewController: InitialStackChild {
    // MARK: - Elements
    let banner          = InitialStackConfig().banner;
    let returnHomeBtn   = InitialStackConfig().homeBtn;
    let error_label     = InitialStackConfig().outputLabel;
    let main_group: UIView = { let this = UIView(); return this; }();
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
        this.addTarget(nil, action: #selector(loginViewController.handleTextFieldChange), for: .editingChanged);
        this.setTextFieldLayer(cornerRadius: 5, borderColor: UIColor.FromRGB(rgbValue: 0xD3D3D3));
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
        this.addTarget(nil, action: #selector(loginViewController.handleTextFieldChange), for: .editingChanged);
        this.setTextFieldLayer(cornerRadius: 5, borderColor: UIColor.FromRGB(rgbValue: 0xD3D3D3));
        return this;
    }();
    let forgot_btn: Button = {
        let this = Button(
            title: "Forgot your password?",
            titleColor: UIColor.black,
            backgroundColor: UIColor.clear,
            backgroundImage: nil,
            animationType: .onBeganTouchFade,
            buttonTag: .forgotPressed
        );
        this.addBorder(borderSide: .bottom, width: 5, color: .black);
        this.addTarget(nil, action: #selector(loginViewController.buttonClick), for: .touchUpInside);
        return this;
    }();
    let login_btn: Button = {
        let this = Button(
            title: "Login",
            titleColor: UIColor.white,
            backgroundColor: UIColor.black,
            backgroundImage: nil,
            animationType: .onBeganTouchPop,
            buttonTag: .loginPressed
        );
        this.setButtonLayer(cornerRadius: 5, borderColor: UIColor.black);
        this.addTarget(nil, action: #selector(loginViewController.buttonClick), for: .touchUpInside);
        return this;
    }();
    let secondary_group: UIView = { let this = UIView(); return this; }();
    let altlogin_label: Label = {
        let this = Label(
            labelStyle: .lined,
            text: "Or connect with",
            titleColor: UIColor.gray,
            backgroundColor: UIColor.clear
        );
        //        this.drawLineOnBothSides(color: UIColor.FromRGB(rgbValue: 0xE8E8E8));
        return this;
    }();
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
        this.addTarget(nil, action: #selector(loginViewController.buttonClick), for: .touchUpInside);
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
        this.addTarget(nil, action: #selector(loginViewController.buttonClick), for: .touchUpInside);
        return this;
    }();

    // MARK: - Setup
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        view.appendSelectSubViews(viewsToAppend:
            [
                banner, email_field, password_field, forgot_btn,
                login_btn, altlogin_label, facebook_btn, google_btn
            ],
          subViewsAppended: { complete in
            [email_field, password_field].forEach { $0.delegate = self as UITextFieldDelegate; }
            constructAutoLayout();
        });

        login_btn.changeEnabledState(shouldDisable: true);
        print("\(#file): \(#function)");
    }

    var emailStr:       String?;
    var passwordStr:    String?;
    
    // MARK: - Event Handlers
    func handleTextFieldChange() {
        guard
            let email = email_field.text, email.isValidEmail,
            let password = password_field.text, !password.isEmpty
            else {
                login_btn.changeEnabledState(shouldDisable: true);
                return;
        }
        emailStr = email; passwordStr = password;
        login_btn.changeEnabledState(shouldDisable: false);
    }
    
    func buttonClick(sender: Button) {
        switch sender.buttonTag {
        case .facebookPressed:  loadModalViewController(to: .socialAPIModalView(type: .facebookAPI, isForLogin: true));
        case .googlePressed:    loadModalViewController(to: .socialAPIModalView(type: .googleAPI, isForLogin: true));
        case .forgotPressed:    loadModalViewController(to: .passwordModalView(email: email_field.text!));
        case .loginPressed:
            AuthService.login(email: emailStr!, password: passwordStr!, onSuccess: { user in
                AppDelegate.shared.rootViewController.allocateNewInterfaceStack(
                    newStack: .allocMainStack,
                    withDataModel: user
                );
            }, onError: { err in
                print("failed to login user");
            });
        default:
            break;
        }
        view.resignAllResponders();
    }
}

// MARK: - Delegations
extension loginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case Fields.emailEngaged.rawValue:
            if textField.text!.isValidEmail {
                password_field.becomeFirstResponder();
            } else {

                return false;
            }
        case Fields.passwordEngaged.rawValue:
            self.view.resignAllResponders();
        default:
            break;
        }
        return true;
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true;
    }
}

extension loginViewController {
    func constructAutoLayout() {
        // ====================|Header|==================== //
        banner.anchor( // Center
            top:            view.safeAreaLayoutGuide.topAnchor,
            leading:        nil,
            bottom:         nil,
            trailing:       nil,
            centerX:        view.centerXAnchor,
            centerY:        nil,
            size:           .init(width: 240, height: 60),
            padding:        .init(top: 0, left: 0, bottom: 0, right: 0)
        );
        
        // ====================|Body|==================== //
        email_field.anchor(
            top:            banner.bottomAnchor,
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
        
        forgot_btn.anchor(
            top:            password_field.bottomAnchor,
            leading:        nil,
            bottom:         nil,
            trailing:       view.safeAreaLayoutGuide.trailingAnchor,
            centerX:        nil,
            centerY:        nil,
            size:           .init(width: view.frame.width/2, height: 15),
            padding:        .init(top: 10, left: 0, bottom: 0, right: 0)
        );
        
        login_btn.anchor(
            top:            forgot_btn.bottomAnchor,
            leading:        password_field.leadingAnchor,
            bottom:         nil,
            trailing:       password_field.trailingAnchor,
            centerX:        nil,
            centerY:        nil,
            size:           .init(width: view.frame.width, height: 45),
            padding:        .init(top: 20, left: 0, bottom: 0, right: 0)
        );
        
        altlogin_label.anchor(
            top:            login_btn.bottomAnchor,
            leading:        login_btn.leadingAnchor,
            bottom:         nil,
            trailing:       login_btn.trailingAnchor,
            centerX:        nil,
            centerY:        nil,
            size:           .init(width: view.frame.width, height: 50),
            padding:        .init(top: 2, left: 0, bottom: 0, right: 0)
        );
        
        facebook_btn.anchor(    // Left
            top:            altlogin_label.bottomAnchor,
            leading:        view.safeAreaLayoutGuide.leadingAnchor,
            bottom:         nil,
            trailing:       nil,
            centerX:        nil,
            centerY:        nil,
            size:           .init(width: view.frame.width/2-(35), height: 35),
            padding:        .init(top: 0, left: 25, bottom: 0, right: 0)
        );
        
        google_btn.anchor( // Right
            top:            altlogin_label.bottomAnchor,
            leading:        nil,
            bottom:         nil,
            trailing:       view.safeAreaLayoutGuide.trailingAnchor,
            centerX:        nil,
            centerY:        nil,
            size:           .init(width: view.frame.width/2-(35), height: 35),
            padding:        .init(top: 0, left: 0, bottom: 10, right: 25)
        );
    }
}
