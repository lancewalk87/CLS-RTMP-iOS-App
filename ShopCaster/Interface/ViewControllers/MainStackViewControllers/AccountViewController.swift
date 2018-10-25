//
//  AccountViewController.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 7/22/18.
//  Copyright © 2018 ShopCaster. All rights reserved.
//

class accountViewController: MainStackChild {
    // MARK: - Elements
    let resuseId = "cell";
    var options: Array<Button> = {
        let this = [
            Button(
                title:              "Profile",
                titleColor:         UIColor.white,
                backgroundColor:    UIColor.black,
                backgroundImage:    nil,
                animationType:      .onBeganTouchPop,
                buttonTag:          .profilePressed
            ),
            Button(
                title:              "Sign Up",
                titleColor:         UIColor.white,
                backgroundColor:    UIColor.black,
                backgroundImage:    nil,
                animationType:      .onBeganTouchPop,
                buttonTag:          .settingsPressed
            ),
            Button(
                title:              "Sign Up",
                titleColor:         UIColor.white,
                backgroundColor:    UIColor.black,
                backgroundImage:    nil,
                animationType:      .onBeganTouchPop,
                buttonTag:          .settingsPressed
            ),
            Button(
                title:              "Sign Up",
                titleColor:         UIColor.white,
                backgroundColor:    UIColor.black,
                backgroundImage:    nil,
                animationType:      .onBeganTouchPop,
                buttonTag:          .aboutPressed
            )
        ];
        return this;
    }();
    let settings_view: UICollectionView = {
        let layout = UICollectionViewLayout();
        let this = UICollectionView(frame: .zero, collectionViewLayout: layout);
        this.backgroundColor = .clear;
        return this;
    }();
    
    // MARK: - Setup
    override func viewWillAppear(_ animated: Bool) {
        view.appendSelectSubViews(viewsToAppend:
            [settings_view],
        subViewsAppended: { complete in
            settings_view.delegate = self;
            constructAutoLayout();
        });
        
        reloadOptions();
        print("\(#file): \(#function)");
    }
    
    // MARK: - Event Handlers
    func reloadOptions() {
        self.settings_view.reloadData();
    }
    
    func buttonClick(sender: Button) {
        switch sender.buttonTag {
        case .profilePressed: break;
        case .ordersPressed: break;
        case .settingsPressed: break;
        case .aboutPressed: break;
        default: break;
        }
        print("\(#file): \(#function)");
    }
}

extension accountViewController {
    func constructAutoLayout() {
        // ====================|Body|==================== //
        settings_view.anchor( // Center
            top:            navigationBar.bottomAnchor,
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

// MARK: - Settings View
class optionItem: UICollectionViewCell {
    weak var option_btn: Button!;
    
    required init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 200));
        self.addSubview(option_btn);
        
        option_btn.anchor( // Fill
            top:            nil,
            leading:        nil,
            bottom:         nil,
            trailing:       nil,
            centerX:        nil,
            centerY:        nil,
            size:           .init(width: frame.width, height: frame.height),
            padding:        .init(top: 0, left: 0, bottom: 0, right: 0)
        );
        print("appending option");
    }
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented"); }
}

extension accountViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.options.count;
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int { return 2; }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let btn = self.options[indexPath.item];
        btn.addTarget(nil, action: #selector(accountViewController.buttonClick), for: .touchUpInside);
        btn.setButtonLayer(cornerRadius: 5, borderColor: UIColor.black);
        
        let option = collectionView.dequeueReusableCell(
            withReuseIdentifier: resuseId,
            for: indexPath
        ) as! optionItem;
        option.option_btn = btn;
        print("COLELCTION VIEW ITEM")
        return option;
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: IndexPath) {
        
        print("You selected cell #\(indexPath.item)!")
    }
}


