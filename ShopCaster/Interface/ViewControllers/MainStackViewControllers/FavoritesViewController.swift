//
//  FavoritesViewController.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 7/22/18.
//  Copyright © 2018 ShopCaster. All rights reserved.
//

class favoritesViewController: MainStackChild {
    // MARK: - Elements
    let type_segmentctl: UISegmentedControl = {
        let this = UISegmentedControl(items: ["All", "Register"]);
        this.layer.cornerRadius = 5.0;
        this.backgroundColor = .black;
        this.tintColor = .white;
        this.addTarget(nil, action: #selector(favoritesViewController.segmentChange), for: .valueChanged);
        return this;
    }();
    let feed_view: userFeedComponent = {
        let this = userFeedComponent();
        return this;
    }();
    
    // MARK: - Setup
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.titleView = type_segmentctl;
        
        print("\(#file): \(#function)");
    }
    
    // MARK: - Event Handlers
    func segmentChange(sender: UISegmentedControl) {
        
        print("\(#file): \(#function)");
    }
}

extension favoritesViewController {
    func constructAutoLayout() {
        
    }
}
