//
//  ScrollViews.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 8/26/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

open class ScrollView: UIScrollView, UIScrollViewDelegate {
    // MARK: - Intializers
    init() {
        super.init(frame: .zero);
        self.delegate = self;
    }
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented"); }

    // MARK: - Overrides
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }

    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        
    }

    public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
    }
}

extension ScrollView {
    // MARK: - ScrollView Types
    public func scrollViewTypeSlideShow(scrollEnabled: Bool? = true, presentationDirection: UIRectEdge? = .right) {
        self.isScrollEnabled = scrollEnabled!;
        if (self.isScrollEnabled) { self.isPagingEnabled = true; }
        
        self.alwaysBounceVertical = true;
        self.alwaysBounceHorizontal = false;
    }
    
    // MARK: - View (Initialized)
    public func configureScrollSubViews(items: Array<Any?>) {
        let colors: Array<UIColor?> = [.red, .blue, .green];
        for i in 0 ..< items.count {
            let testView = UIView(frame: self.frame);
            testView.backgroundColor = colors[i];
            addSubview(testView);
        }
    }

    func setContentViewSize(offset:CGFloat = 0.0) {
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        
        var maxHeight : CGFloat = 0
        for view in subviews {
            if view.isHidden {
                continue
            }
            let newHeight = view.frame.origin.y + view.frame.height
            if newHeight > maxHeight {
                maxHeight = newHeight
            }
        }
        contentSize = CGSize(width: contentSize.width, height: maxHeight + offset)
        showsHorizontalScrollIndicator = true
        showsVerticalScrollIndicator = true
    }
}
