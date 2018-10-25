//
//  RegisterViewController.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 7/22/18.
//  Copyright © 2018 ShopCaster. All rights reserved.
//

class registerViewController: InitialStackChild {
    // MARK: - Elements
    let returnHomeBtn   = InitialStackConfig().homeBtn;
    let error_label     = InitialStackConfig().outputLabel;
    
    let form_container: UIView = { let this = UIView(); return this; }();
    let profileimg_btn: Button = {
        let this = Button(
            title: "",
            titleColor: UIColor.white,
            backgroundColor: UIColor.clear,
            backgroundImage: UIImage(named: "empty-profile.png"),
            animationType: .onBeganTouchPop,
            buttonTag: .profilePressed
        );
        this.addTarget(nil, action: #selector(registerViewController.buttonClick), for: .touchUpInside);
        return this;
    }();
    let fullname_field: TextField = {
        let this = TextField(
            inputStruct: FieldStructure(
                placeholder: "Full Name",
                tintColor: UIColor.gray,
                textColor: UIColor.black,
                backgroundColor: UIColor.FromRGB(rgbValue: 0xE8E8E8),
                textAlignment: .left,
                textPadding: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
            ),
            inputType:  .standard,
            inputTag:   .fullnameEngaged
        );
        this.setTextFieldLayer(cornerRadius: 5, borderColor: UIColor.FromRGB(rgbValue: 0xD3D3D3));
        return this;
    }();
    let birthdate_field: TextField = {
        let this = TextField(
            inputStruct: FieldStructure(
                placeholder: "Date of birth",
                tintColor: UIColor.gray,
                textColor: UIColor.black,
                backgroundColor: UIColor.FromRGB(rgbValue: 0xE8E8E8),
                textAlignment: .left,
                textPadding: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
            ),
            inputType:  .date,
            inputTag:   .birthdateEngaged
        );
        this.setTextFieldLayer(cornerRadius: 5, borderColor: UIColor.FromRGB(rgbValue: 0xD3D3D3));
        return this;
    }();
    let address_field: TextField = {
        let this = TextField(
            inputStruct: FieldStructure(
                placeholder: "Street Address",
                tintColor: UIColor.gray,
                textColor: UIColor.black,
                backgroundColor: UIColor.FromRGB(rgbValue: 0xE8E8E8),
                textAlignment: .left,
                textPadding: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
            ),
            inputType:  .standard,
            inputTag:   .addressEngaged
        );
        this.setTextFieldLayer(cornerRadius: 5, borderColor: UIColor.FromRGB(rgbValue: 0xD3D3D3));
        return this;
    }();
    let city_field: TextField = {
        let this = TextField(
            inputStruct: FieldStructure(
                placeholder: "City",
                tintColor: UIColor.gray,
                textColor: UIColor.black,
                backgroundColor: UIColor.FromRGB(rgbValue: 0xE8E8E8),
                textAlignment: .left,
                textPadding: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
            ),
            inputType:  .standard,
            inputTag:   .cityEngaged
        );
        this.setTextFieldLayer(cornerRadius: 5, borderColor: UIColor.FromRGB(rgbValue: 0xD3D3D3));
        return this;
    }();
    let state_field: TextField = {
        let this = TextField(
            inputStruct: FieldStructure(
                placeholder: "State",
                tintColor: UIColor.gray,
                textColor: UIColor.black,
                backgroundColor: UIColor.FromRGB(rgbValue: 0xE8E8E8),
                textAlignment: .left,
                textPadding: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
            ),
            inputType:  .picker,
            inputTag:   .stateEngaged
        );
        this.setTextFieldLayer(cornerRadius: 5, borderColor: UIColor.FromRGB(rgbValue: 0xD3D3D3));
        return this;
    }();
    let postcode_field: TextField = {
        let this = TextField(
            inputStruct: FieldStructure(
                placeholder: "Post Code",
                tintColor: UIColor.gray,
                textColor: UIColor.black,
                backgroundColor: UIColor.FromRGB(rgbValue: 0xE8E8E8),
                textAlignment: .left,
                textPadding: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
            ),
            inputType:  .number,
            inputTag:   .postcodeEngaged
        );
        this.setTextFieldLayer(cornerRadius: 5, borderColor: UIColor.FromRGB(rgbValue: 0xD3D3D3));
        return this;
    }();
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
        this.setTextFieldLayer(cornerRadius: 5, borderColor: UIColor.FromRGB(rgbValue: 0xD3D3D3));
        return this;
        
    }();
    let register_btn: Button = {
        let this = Button(
            title: "Register",
            titleColor: UIColor.white,
            backgroundColor: UIColor.black,
            backgroundImage: nil,
            animationType: .onBeganTouchPop,
            buttonTag: .registerPressed
        );
        this.setButtonLayer(cornerRadius: 5, borderColor: UIColor.black);
        this.addTarget(nil, action: #selector(registerViewController.buttonClick), for: .touchUpInside);
        return this;
    }();
    
    // MARK: - Setup
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);        
        form_container.appendSelectSubViews(viewsToAppend:
            [
                profileimg_btn, fullname_field, birthdate_field, address_field,
                city_field, state_field, postcode_field, email_field,
                password_field, register_btn
            ],
        subViewsAppended: { complete in
            view.appendSelectSubViews(viewsToAppend:
                [form_container],
            subViewsAppended: { complete in
                [
                    fullname_field, birthdate_field, address_field, city_field,
                    state_field, postcode_field, email_field, password_field
                ].forEach { $0.delegate = self as UITextFieldDelegate; }
                constructAutoLayout();
            });
        });
        print("\(#file): \(#function)");
    }
    
    var profileImg: UIImage?;
    var userName:   String?;
    var birthdate: String?;
    var address: String?;
    var city: String?;
    var state: String?;
    var postcode: String?;
    var email: String?;
    var password: String?;
    
    // MARK: - Event Handlers
    func buttonClick(sender: Button) {
        switch sender.buttonTag {
        case .profilePressed:   loadChildViewController(to: .contentViewController);
        case .facebookPressed:  loadModalViewController(to: .socialAPIModalView(type: .facebookAPI, isForLogin: false));
        case .googlePressed:    loadModalViewController(to: .socialAPIModalView(type: .googleAPI, isForLogin: false));
        case .forgotPressed:    loadModalViewController(to: .passwordModalView(email: email_field.text!)); 
        case .registerPressed:
            if let profileImg = self.profileImg, let data = UIImageJPEGRepresentation(profileImg, 0.1) {
                AuthService.register(userData: [
                    "profileImg": data,
                    "userName": userName!,
                    "birthdate": birthdate!,
                    "address": address!,
                    "city":city!,
                    "state":state!,
                    "postcode": postcode!,
                    "email":email!,
                    "password": password!
                ], onSuccess: {
                    print("SUCCESS");
                }, onError: { err in
//                    print("EROR \(err)");
                });
            } else {
                
            }
        default:
            break;
        }
        view.resignAllResponders();
        print("\(#file): \(#function)");
    }
}

// MARK: - Delegations
extension registerViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case Fields.fullnameEngaged.rawValue:
            birthdate_field.becomeFirstResponder();
        case Fields.birthdateEngaged.rawValue:
            address_field.becomeFirstResponder();
        case Fields.addressEngaged.rawValue:
            city_field.becomeFirstResponder();
        case Fields.cityEngaged.rawValue:
            state_field.becomeFirstResponder();
        case Fields.stateEngaged.rawValue:
            postcode_field.becomeFirstResponder();
        case Fields.postcodeEngaged.rawValue:
            email_field.becomeFirstResponder();
        case Fields.emailEngaged.rawValue:
            password_field.becomeFirstResponder();
        case Fields.passwordEngaged.rawValue:
            // verify password:
            view.resignAllResponders();
        default:
            break;
        }
        
        return true;
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool { return true; }
}

extension registerViewController {
    func constructAutoLayout() {
        form_container.anchor( // Fill
            top:            view.safeAreaLayoutGuide.topAnchor,
            leading:        view.safeAreaLayoutGuide.leadingAnchor,
            bottom:         view.safeAreaLayoutGuide.bottomAnchor,
            trailing:       view.safeAreaLayoutGuide.trailingAnchor,
            centerX:        nil,
            centerY:        nil,
            size:           .init(width: 0, height: 0),
            padding:        .init(top: 0, left: 0, bottom: 0, right: 0)
        );
        
        // ====================|Body|==================== //
        //        profileimg_btn.anchor( // Left
        //            top:            view.safeAreaLayoutGuide.topAnchor,
        //            leading:        view.safeAreaLayoutGuide.leadingAnchor,
        //            bottom:         nil,
        //            trailing:       nil,
        //            centerX:        nil,
        //            centerY:        nil,
        //            size:           .init(width: 70, height: 70),
        //            padding:        .init(top: 10, left: 15, bottom: 0, right: 0)
        //        );
        
        let profileConstant = view.frame.width/4;
        let fieldHeight = profileConstant/2;
        
        profileimg_btn.anchor( // Left
            top:            view.safeAreaLayoutGuide.topAnchor,
            leading:        view.safeAreaLayoutGuide.leadingAnchor,
            bottom:         nil,
            trailing:       nil,
            centerX:        nil,
            centerY:        nil,
            size:           .init(width: profileConstant, height: profileConstant),
            padding:        .init(top: 10, left: 15, bottom: 0, right: 0)
        );
        
        fullname_field.anchor( // Right - Top
            top:            view.safeAreaLayoutGuide.topAnchor,
            leading:        profileimg_btn.trailingAnchor,
            bottom:         nil,
            trailing:       view.safeAreaLayoutGuide.trailingAnchor,
            centerX:        nil,
            centerY:        nil,
            size:           .init(width: 0, height: 35),
            padding:        .init(top: 10, left: 15, bottom:  0, right: 15)
        );
        
        birthdate_field.anchor( // Right - Bottom
            top:            fullname_field.bottomAnchor,
            leading:        profileimg_btn.trailingAnchor,
            bottom:         nil,
            trailing:       view.safeAreaLayoutGuide.trailingAnchor,
            centerX:        nil,
            centerY:        nil,
            size:           .init(width: 0, height: 35),
            padding:        .init(top: 10, left: 15, bottom:  0, right: 15)
        );
        
        address_field.anchor( // Left
            top:            birthdate_field.bottomAnchor,
            leading:        view.safeAreaLayoutGuide.leadingAnchor,
            bottom:         nil,
            trailing:       nil,
            centerX:        nil,
            centerY:        nil,
            size:           .init(width: view.frame.width/2-(15), height: 35),
            padding:        .init(top: 40, left: 10, bottom: 10, right: 0)
        );
        
        city_field.anchor( // Right
            top:            address_field.topAnchor,
            leading:        nil,
            bottom:         nil,
            trailing:       view.safeAreaLayoutGuide.trailingAnchor,
            centerX:        nil,
            centerY:        nil,
            size:           .init(width: view.frame.width/2-(15), height: 35),
            padding:        .init(top: 0, left: 0, bottom: 20, right: 10)
        );
        
        state_field.anchor( // Left
            top:            city_field.bottomAnchor,
            leading:        view.safeAreaLayoutGuide.leadingAnchor,
            bottom:         nil,
            trailing:       nil,
            centerX:        nil,
            centerY:        nil,
            size:           .init(width: view.frame.width/2-(15), height: 35),
            padding:        .init(top: 20, left: 10, bottom: 10, right: 0)
        );
        
        postcode_field.anchor( // Right
            top:            state_field.topAnchor,
            leading:        nil,
            bottom:         nil,
            trailing:       view.safeAreaLayoutGuide.trailingAnchor,
            centerX:        nil,
            centerY:        nil,
            size:           .init(width: view.frame.width/2-(15), height: 35),
            padding:        .init(top: 0, left: 0, bottom: 20, right: 10)
        );
        
        email_field.anchor(
            top:            postcode_field.bottomAnchor,
            leading:        view.safeAreaLayoutGuide.leadingAnchor,
            bottom:         nil,
            trailing:       view.safeAreaLayoutGuide.trailingAnchor,
            centerX:        nil,
            centerY:        nil,
            size:           .init(width: view.frame.width, height: 35),
            padding:        .init(top: 40, left: 10, bottom:  15, right: 10)
        );
        
        password_field.anchor(
            top:            email_field.bottomAnchor,
            leading:        view.safeAreaLayoutGuide.leadingAnchor,
            bottom:         nil,
            trailing:       view.safeAreaLayoutGuide.trailingAnchor,
            centerX:        nil,
            centerY:        nil,
            size:           .init(width: view.frame.width, height: 35),
            padding:        .init(top: 20, left: 10, bottom:  15, right: 10)
        );
        
        // ====================|Footer|==================== //
        register_btn.anchor(
            top:            nil,
            leading:        password_field.leadingAnchor,
            bottom:         view.safeAreaLayoutGuide.bottomAnchor,
            trailing:       password_field.trailingAnchor,
            centerX:        nil,
            centerY:        nil,
            size:           .init(width: view.frame.width, height: 45),
            padding:        .init(top: 20, left: 0, bottom: 10, right: 0)
        );
    }
}
