//
//  CollectionViews.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 9/7/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

open class CollectionView: UICollectionView {
    // MARK: - Intializers
    required public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: layout);
    }
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented"); }
}
