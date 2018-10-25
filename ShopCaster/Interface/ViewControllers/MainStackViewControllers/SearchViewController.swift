//
//  SearchViewController.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 7/22/18.
//  Copyright © 2018 ShopCaster. All rights reserved.
//

class searchViewController: MainStackChild {
    // MARK: - Elements
    let search_bar: UISearchBar = {
        let this = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200, height: 20));
        this.placeholder = "Search";
        this.sizeToFit();
        return this;
    }();
    let feed_view: userFeedComponent = {
        let this = userFeedComponent();
        return this;
    }();

    // MARK: - Setup
    override func viewWillAppear(_ animated: Bool) {
        search_bar.delegate = self;
//        navigationItem.title = searchBar;
        navigationItem.titleView = search_bar;
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: searchBar);
        
        print("\(#file): \(#function)");
    }
}

extension searchViewController {
    func constructAutoLayout() {
        
    }
}

// MARK: - Search Delegation
extension searchViewController: UISearchBarDelegate {
    
}

