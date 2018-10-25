//
//  InterfaceConfig.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 8/30/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

// MARK: - Initial Stack Configuration
extension landingViewController {
//    override public func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated);
//        view.backgroundColor = UIColor.white;
//        navigationController?.setNavigationBarHidden(true, animated: false);
//
//        view.appendSelectSubViews(viewsToAppend:
//            [
//                display,
//                indicator,
//                banner,
//                register_btn,
//                login_btn
//            ],
//        subViewsAppended: { complete in
////            display.configureScrollSubViews(items: ["img", "img", "img"]);
//            layoutConstructor();
//        });
//    }
//
//    override public func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated);
//        view.removeSubviews();
//        navigationController?.setNavigationBarHidden(false, animated: false);
//    }
//
//    private func layoutConstructor() {
//        // ====================|Header|==================== //
//        banner.anchor( // Center
//            top:            view.safeAreaLayoutGuide.topAnchor,
//            leading:        nil,
//            bottom:         nil,
//            trailing:       nil,
//            centerX:        view.centerXAnchor,
//            centerY:        nil,
//            size:           .init(width: 240, height: 60),
//            padding:        .init(top: 0, left: 0, bottom: 0, right: 0)
//        );
//
//        // ====================|Body|==================== //
//        display.anchor( // Fill
//            top:            view.safeAreaLayoutGuide.topAnchor,
//            leading:        view.safeAreaLayoutGuide.leadingAnchor,
//            bottom:         view.safeAreaLayoutGuide.bottomAnchor,
//            trailing:       view.safeAreaLayoutGuide.trailingAnchor,
//            centerX:        nil,
//            centerY:        nil,
//            size:           .init(width: 0, height: 0),
//            padding:        .init(top: 0, left: 0, bottom: 0, right: 0)
//        );
//
//        // ====================|Footer|==================== //
//        login_btn.anchor( // Left
//            top:            nil,
//            leading:        view.safeAreaLayoutGuide.leadingAnchor,
//            bottom:         view.safeAreaLayoutGuide.bottomAnchor,
//            trailing:       nil,
//            centerX:        nil,
//            centerY:        nil,
//            size:           .init(width: view.frame.width/2-(15), height: 45),
//            padding:        .init(top: 0, left: 10, bottom: 10, right: 0)
//        );
//
//        register_btn.anchor( // Right
//            top:            nil,
//            leading:        nil,
//            bottom:         view.safeAreaLayoutGuide.bottomAnchor,
//            trailing:       view.safeAreaLayoutGuide.trailingAnchor,
//            centerX:        nil,
//            centerY:        nil,
//            size:           .init(width: view.frame.width/2-(15), height: 45),
//            padding:        .init(top: 0, left: 0, bottom: 10, right: 10)
//        );
//
//        indicator.anchor( // Center
//            top:            nil,
//            leading:        nil,
//            bottom:         register_btn.topAnchor,
//            trailing:       view.safeAreaLayoutGuide.trailingAnchor,
//            centerX:        nil,
//            centerY:        nil,
//            size:           .init(width: view.frame.width, height: 60),
//            padding:        .init(top: 0, left: 0, bottom: 0, right: 0)
//        );
//    }
}

extension loginViewController {
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        view.backgroundColor = UIColor.white; title = "Login";
        navigationController?.navigationBar.topItem?.setLeftBarButton(returnHomeBtn, animated: true);

        view.appendSelectSubViews(viewsToAppend:
            [
                banner,
                email_field,
                password_field,
                forgot_btn,
                login_btn,
                altlogin_label,
                facebook_btn,
                google_btn
            ],
        subViewsAppended: { complete in
            layoutConstructor();
        });
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        view.removeSubviews();
    }
    
    private func layoutConstructor() {
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
        altlogin_label.drawLineOnBothSides(color: UIColor.gray);
        
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
        
        // ====================|Footer|==================== //
    }
}

extension registerViewController {
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        view.backgroundColor = UIColor.white; title = "Register";
        navigationController?.navigationBar.topItem?.setLeftBarButton(returnHomeBtn, animated: true);

        form_container.appendSelectSubViews(viewsToAppend:
            [
                profileimg_btn,
                fullname_field,
                birthdate_field,
                address_field,
                city_field,
                state_field,
                postcode_field,
                email_field,
                password_field,
                register_btn
            ],
        subViewsAppended: { complete in
            view.appendSelectSubViews(viewsToAppend:
                [form_container],
            subViewsAppended: { complete in
                form_container.subviews.forEach {
                    if let input = $0 as? UITextField { input.delegate = self; }
                }
                layoutConstructor();
            });
        });
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        view.removeSubviews();
    }
    
    private func layoutConstructor() {
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

// MARK: - Main Stack Configuration
extension homeViewController {
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated); view.backgroundColor = UIColor.FromRGB(rgbValue: 0xfafff0);
        navigationItem.titleView = MainStackConfig().banner;
//        view.appendSelectSubViews(viewsToAppend:
//            [peopleView, feedView],
//        subViewsAppended: { complete in
//            layoutConstructor();
//        });
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated); 
        view.removeSubviews();
    }
    
    private func layoutConstructor() {
        // ====================|Top|==================== //
        peopleView.anchor(
            top:            view.safeAreaLayoutGuide.topAnchor,
            leading:        view.safeAreaLayoutGuide.leadingAnchor,
            bottom:         nil,
            trailing:       view.safeAreaLayoutGuide.trailingAnchor,
            centerX:        nil,
            centerY:        nil,
            size:           .init(width: 0, height: view.frame.height/8),
            padding:        .init(top: 0, left: 0, bottom: 0, right: 0)
        );
        
        // ====================|Body|==================== //
        feedView.anchor(
            top:            peopleView.bottomAnchor,
            leading:        view.safeAreaLayoutGuide.leadingAnchor,
            bottom:         view.safeAreaLayoutGuide.bottomAnchor,
            trailing:       view.safeAreaLayoutGuide.trailingAnchor,
            centerX:        nil,
            centerY:        nil,
            size:           .init(width: 0, height: 0),
            padding:        .init(top: 0, left: 0, bottom: 0, right: 0)
        );
    }
}

extension searchViewController {
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated); view.backgroundColor = UIColor.FromRGB(rgbValue: 0xfafff0);
        navigationItem.titleView = SearchPageConfig().search_bar;
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        view.removeSubviews();
    }
    
    private func layoutConstructor() {
        
    }
}

extension favoritesViewController {
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated); view.backgroundColor = UIColor.FromRGB(rgbValue: 0xfafff0);
        navigationItem.titleView = FavoritesPageConfig().type_bar;
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        view.removeSubviews();
    }
    
    private func layoutConstructor() {
        
    }
}

extension accountViewController {
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated); view.backgroundColor = UIColor.FromRGB(rgbValue: 0xfafff0);
        navigationItem.titleView = MainStackConfig().banner;
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        view.removeSubviews();
    }
    
    private func layoutConstructor() {
        
    }
}

// MARK: - User Stack Configuration
extension feedViewController {
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        view.removeSubviews();
    }
    
    private func layoutConstructor() {
        
    }
}

extension storeViewController {
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        view.removeSubviews();
    }
    
    private func layoutConstructor() {
        
    }
}

extension galleryViewController {
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        view.removeSubviews();
    }
    
    private func layoutConstructor() {
        
    }
}

extension infoViewController {
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        view.removeSubviews();
    }
    
    private func layoutConstructor() {
        
    }
}

// MARK: - Content Stack Configuration
extension contentViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
    }
}

extension photoViewController {
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        view.removeSubviews();
    }
    
    private func layoutConstructor() {
        
    }
}

extension videoViewController {
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        view.removeSubviews();
    }
    
    private func layoutConstructor() {
        
    }
}

extension albumViewController {
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        view.removeSubviews();
    }
    
    private func layoutConstructor() {
        
    }
}

extension liveViewController {
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
    }
    
    override public func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        view.removeSubviews();
    }
    
    private func layoutConstructor() {
        
    }
}
