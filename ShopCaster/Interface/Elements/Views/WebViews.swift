//
//  WebViews.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 9/7/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

open class WebView: UIWebView {
    // MARK: - Properties
    var targetURL: URL;
    
    // MARK: - Initializers
    required public init(withURL: URL!) {
        self.targetURL = withURL;
        super.init(frame: .zero);
    }
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented"); }
}
