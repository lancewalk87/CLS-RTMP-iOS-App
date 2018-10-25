//
//  PasswordModalView.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 9/13/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

class passwordModalView: UIViewController {
    // MARK: - Properties
    private var rootViewController: UIViewController;
    var initialEmail: String?;
    
    // MARK: Iniialization
    required public init(for root: UIViewController!, entryEmail: String) {
        self.rootViewController = root;
        self.initialEmail = entryEmail;
        super.init(nibName: nil, bundle: nil);
        
        if initialEmail!.isValidEmail {
            print("Searching for user email in database");
        } else {
            print("EMAIL IS INVALID");
        }
        
        print("\(#file): \(#function)");
    }
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented"); }
    
    var account_field: TextField!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        view.backgroundColor = .gray;
        
        account_field = TextField(
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
        
        account_field.text = initialEmail;
    }
}
