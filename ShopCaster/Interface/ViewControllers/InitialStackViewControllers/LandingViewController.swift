//
//  LandingViewController.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 8/15/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

class landingViewController: InitialStackChild {
    // MARK: - Elements
    let banner = InitialStackConfig().banner;
    let display_view: ImageView = {
        let this = ImageView(
            imagesInView:           ["", "", ""],
            contentMode:            .scaleAspectFit,
            backgroundColor:        UIColor.clear
        );
        return this;
    }();
    let display: ImageView = {
        let this = ImageView(
            imagesInView:           ["", "", ""],
            contentMode:            .scaleAspectFit,
            backgroundColor:        UIColor.clear
        );
        return this;
    }();
    let indicator: UIPageControl = {
        let this = UIPageControl();
        this.currentPageIndicatorTintColor = UIColor.black;
        this.pageIndicatorTintColor = UIColor.gray;
        this.numberOfPages = 3;
        this.currentPage = 0;
        this.layer.cornerRadius = 200/8;
        return this;
    }();
    let register_btn: Button = {
        let this = Button(
            title:              "Sign Up",
            titleColor:         UIColor.white,
            backgroundColor:    UIColor.black,
            backgroundImage:    nil,
            animationType:      .onBeganTouchPop,
            buttonTag:          .registerPressed
        );
        this.setButtonLayer(cornerRadius: 5, borderColor: UIColor.black);
        this.addTarget(nil, action: #selector(landingViewController.buttonClick), for: .touchUpInside);
        return this;
    }();
    let login_btn: Button = {
        let this = Button   (
            title:              "Login",
            titleColor:         UIColor.black,
            backgroundColor:    UIColor.white,
            backgroundImage:    nil,
            animationType:      .onBeganTouchPop,
            buttonTag:          .loginPressed
        );
        this.setButtonLayer(cornerRadius: 5, borderColor: UIColor.black);
        this.addTarget(nil, action: #selector(landingViewController.buttonClick), for: .touchUpInside);
        return this;
    }();
    
    // MARK: - Setup
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        view.appendSelectSubViews(viewsToAppend:
            [display, indicator, banner, register_btn, login_btn],
        subViewsAppended: { complete in
            constructAutoLayout();
        });
        print("\(#file): \(#function)");
    }
    
    // MARK: - Event Handlers
    func buttonClick(sender: Button) {
        switch sender.buttonTag {
        case .loginPressed:     loadChildViewController(to: .loginViewController);
        case .registerPressed:  loadChildViewController(to: .registerViewController);
        default:
            break;
        }
        print("\(#file): \(#function)");
    }
}

extension landingViewController {
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
        display.anchor( // Fill
            top:            view.safeAreaLayoutGuide.topAnchor,
            leading:        view.safeAreaLayoutGuide.leadingAnchor,
            bottom:         view.safeAreaLayoutGuide.bottomAnchor,
            trailing:       view.safeAreaLayoutGuide.trailingAnchor,
            centerX:        nil,
            centerY:        nil,
            size:           .init(width: 0, height: 0),
            padding:        .init(top: 0, left: 0, bottom: 0, right: 0)
        );
        
        // ====================|Footer|==================== //
        login_btn.anchor( // Left
            top:            nil,
            leading:        view.safeAreaLayoutGuide.leadingAnchor,
            bottom:         view.safeAreaLayoutGuide.bottomAnchor,
            trailing:       nil,
            centerX:        nil,
            centerY:        nil,
            size:           .init(width: view.frame.width/2-(15), height: 45),
            padding:        .init(top: 0, left: 10, bottom: 10, right: 0)
        );
        
        register_btn.anchor( // Right
            top:            nil,
            leading:        nil,
            bottom:         view.safeAreaLayoutGuide.bottomAnchor,
            trailing:       view.safeAreaLayoutGuide.trailingAnchor,
            centerX:        nil,
            centerY:        nil,
            size:           .init(width: view.frame.width/2-(15), height: 45),
            padding:        .init(top: 0, left: 0, bottom: 10, right: 10)
        );
        
        indicator.anchor( // Center
            top:            nil,
            leading:        nil,
            bottom:         register_btn.topAnchor,
            trailing:       view.safeAreaLayoutGuide.trailingAnchor,
            centerX:        nil,
            centerY:        nil,
            size:           .init(width: view.frame.width, height: 60),
            padding:        .init(top: 0, left: 0, bottom: 0, right: 0)
        );
    }
}
