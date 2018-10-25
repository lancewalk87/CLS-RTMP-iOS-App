//
//  HomeViewController.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 7/22/18.
//  Copyright © 2018 ShopCaster. All rights reserved.
//

class homeViewController: MainStackChild {
    // MARK: - Elements
    let feed_view: userFeedComponent = {
        let this = userFeedComponent();
        return this;
    }();
    
    // MARK: - Setup
    var posts = [Post]();
    var users = [User]();
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        navigationItem.titleView = MainStackConfig().banner;

        view.appendSelectSubViews(viewsToAppend:
            [feed_view],
        subViewsAppended: { complete in
            feed_view.delegate = self;
            constructAutoLayout();
        });

        if let path = Bundle.main.path(forResource: "all_posts", ofType: "json") {
            do {
                let data = try(Data(contentsOf: URL(fileURLWithPath: path), options: NSData.ReadingOptions.mappedIfSafe));
                let jsonDictionary = try(JSONSerialization.jsonObject(with: data, options: .mutableContainers)) as? [String: Any];

                if let postsArray = jsonDictionary?["posts"] as? [[String: AnyObject]] {
                    self.posts = [Post]();

                    for postDictionary in postsArray {
                        let post = Post();
//                        post.setValuesForKeys(postDictionary);
                        self.posts.append(post);
                    }
                }
            } catch let err { print(err); }
        }
        
        feed_view.register(feedCell.self, forCellWithReuseIdentifier: "cellId");
        print("\(#file): \(#function)");
    }
    
    // MARK: - Event Handlers
}

extension homeViewController {
    func constructAutoLayout() {
        // ====================|Body|==================== //
        feed_view.anchor( // Center
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

// MARK: - Feed Delegation
extension homeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.users.count;
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 1; }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "postCell", for: indexPath) as! feedCell;
        cell.post = posts[indexPath.item];
//        cell.feedController = self;
        return cell;
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//    }
}
