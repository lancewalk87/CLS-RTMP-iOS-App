//
//  UserFeedComponenet.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 9/8/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

public protocol FeedControllerDelegate: NSObjectProtocol {
    func feedController(_ collectionView: userFeedComponent, shouldPrepareData: [Any?])
    func feedController(_ collectionView: userFeedComponent, shouldReloadData: [Any?])
}

public class userFeedComponent: UICollectionView {
    // MARK: - Initializers
    let layout: UICollectionViewLayout = {
        let this = UICollectionViewLayout();
        return this;
    }();
    
    required public init() {
        super.init(frame: .zero, collectionViewLayout: layout);
        backgroundColor = UIColor.FromRGB(rgbValue: 0xfdfeef);
        alwaysBounceVertical = true;
        print("\(#file): \(#function)");
    }
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented"); }
    
    // MARK: - Event Handlers
}

public class feedCell: UICollectionViewCell {
    // MARK: - Properties
    weak var profileImgView: UIImageView!;
    weak var nameLabel: UILabel!;
    weak var postImageView: UIImageView!;
    weak var likeImageVIew: UIImageView!;
    let comment_btn: Button = {
        let this = Button   (
            title:              "",
            titleColor:         UIColor.black,
            backgroundColor:    UIColor.white,
            backgroundImage:    nil,
            animationType:      .onBeganTouchPop,
            buttonTag:          .commentPressed
        );
        return this;
    }();
    let share_btn: Button = {
        let this = Button   (
            title:              "",
            titleColor:         UIColor.black,
            backgroundColor:    UIColor.white,
            backgroundImage:    nil,
            animationType:      .onBeganTouchPop,
            buttonTag:          .sharePressed
        );
        return this;
    }();
    let like_btn: Button = {
        let this = Button   (
            title:              "",
            titleColor:         UIColor.black,
            backgroundColor:    UIColor.white,
            backgroundImage:    nil,
            animationType:      .onBeganTouchPop,
            buttonTag:          .likePressed
        );
        return this;
    }();
    weak var likeCountButton: UIButton!;
    weak var captionLabel: UILabel!;
    
    var srcVC: UIViewController?;
    var postRef: NSObject?;
    
    var post: Post? { didSet { updateView(); }}
    var user: User? { didSet { updateUserInfo(); }}
    
    // MARK: - Setup
    override public func awakeFromNib() {
        super.awakeFromNib();
        nameLabel.text = "";
        captionLabel.text = "";
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated);
//    }
    
    // MARK: - Setters
    func updateView() {
        captionLabel.text = post?.photoURL;
        
        if let photoURL = post?.photoURL {
            //            postImageView.sd_setImage(with: URL(string: photoURL))
        }
        
        //        // get the latest post
        //        API.Post.REF_POSTS.child(post!.id!).observeSingleEvent(of: .value, with: { postSnapshot in
        //            if let postDictionary = postSnapshot.value as? [String:Any] {
        //                let post = Post.transformPost(postDictionary: postDictionary, key: postSnapshot.key)
        //                self.updateLike(post: post)
        //            }
        //        })
        //
        //        // observe like field to update if others like this post
        //        API.Post.REF_POSTS.child(post!.id!).observe(.childChanged, with: { snapshot in
        //            if let value = snapshot.value as? Int {
        //                self.likeCountButton.setTitle("\(value) Likes", for: .normal)
        //            }
        //        })
    }
    
    override public func prepareForReuse() {
        super.prepareForReuse();
        profileImgView.image = UIImage(named: "empty-profile.png");
    }
    
    func updateUserInfo() {
        nameLabel.text = user?.fullName;
        //        if let photoURL = user?.profileImageURL {
        //            profileImageView.sd_setImage(with: URL(string: photoURL), placeholderImage: UIImage(named: "profile"))
        //        }
    }
    
    // MARK: - Event Handlers
    func buttonClick(sender: Button) {
        switch sender.buttonTag {
        case .commentPressed:
            if let id = post?.id {
                //                srcVC?.performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
            }
        case .likePressed:
            //            postReference = API.Post.REF_POSTS.child(post!.id!)
            //            incrementLikes(forReference: postReference)
            print("like pressed");
        default: break;
        }
    }
    
    //    func incrementLikes(forReference ref: FIRDatabaseReference) {
    //        // Dealing with concurrent modifications based on:
    //        // https://firebase.google.com/docs/database/ios/read-and-write
    //        // Section: Save data as transactions
    //        ref.runTransactionBlock({ (currentData: FIRMutableData) -> FIRTransactionResult in
    //            if var post = currentData.value as? [String : AnyObject], let uid = FIRAuth.auth()?.currentUser?.uid {
    //                var likes: Dictionary<String, Bool>
    //                likes = post["likes"] as? [String : Bool] ?? [:]
    //                var likeCount = post["likeCount"] as? Int ?? 0
    //                if let _ = likes[uid] {
    //                    // Unlike the post and remove self from stars
    //                    likeCount -= 1
    //                    likes.removeValue(forKey: uid)
    //                } else {
    //                    // Like the post and add self to stars
    //                    likeCount += 1
    //                    likes[uid] = true
    //                }
    //                post["likeCount"] = likeCount as AnyObject?
    //                post["likes"] = likes as AnyObject?
    //
    //                // Set value and report transaction success
    //                currentData.value = post
    //
    //                return FIRTransactionResult.success(withValue: currentData)
    //            }
    //            return FIRTransactionResult.success(withValue: currentData)
    //        }) { (error, committed, snapshot) in
    //            if let error = error {
    //                print(error.localizedDescription)
    //            }
    //
    //            if let postDictionary = snapshot?.value as? [String:Any] {
    //                let post = Post.transformPost(postDictionary: postDictionary, key: snapshot!.key)
    //                self.updateLike(post: post)
    //            }
    //        }
    //    }
    //
    //    func updateLike(post: Post) {
    //        let imageName = post.likes == nil || !post.isLiked! ? "like" : "likeSelected"
    //        likeImageView.image = UIImage(named: imageName)
    //
    //        // display a message for Likes
    //        guard let count = post.likeCount else {
    //            return
    //        }
    //
    //        if count != 0 {
    //            likeCountButton.setTitle("\(count) Likes", for: .normal)
    //        } else if post.likeCount == 0 {
    //            likeCountButton.setTitle("Be the first to Like this", for: .normal)
    //        }
    //    }
}



