//
//  LiveChatComponenet.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 9/19/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

class liveChatComponenet: UIView {
    var comments: [Comment] = []

}

extension liveChatComponenet: UITextFieldDelegate {
    
}

extension liveChatComponenet: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! commentCell
        cell.comment = comments[(indexPath as NSIndexPath).row]
        return cell
    }
}

class commentCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var commentContainer: UIView!

    var comment: Comment! {
        didSet {
            updateUI()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        commentContainer.layer.cornerRadius = 3
    }

    func updateUI() {
//        titleLabel.attributedText = comment.text.attributedComment()
    }
}
