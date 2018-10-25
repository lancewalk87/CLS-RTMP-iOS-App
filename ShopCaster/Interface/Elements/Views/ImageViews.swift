//
//  ImageView.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 8/25/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

open class ImageView: UIImageView {
    // MARK: - Intializers
    required public init(
        imagesInView: [String],
        contentMode: UIViewContentMode,
        backgroundColor: UIColor
    ) {
        super.init(frame: .zero);
        self.backgroundColor = backgroundColor;
        self.contentMode = contentMode;
        if imagesInView.count > 1 { setImagesFromPath(); }
        else { self.image = UIImage(named: imagesInView[0]); }
    }
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented"); }
    
    // MARK: - Methods
    func setImagesFromPath() {
        
    }
    
    func imageFromUrl(urlString: String) {
//        HTTPRouter().httpAsynchronousRequest(urlString, completion: { completionHandler in
//            let statusCode: Int = (completionHandler?.statusCode)!;
//            if statusCode == 200 {
//                //                self.image = UIImage(data: completionHandler?.allHeaderFields);
//            } else { return; }
//        });
    }
    
    func imageFromUserDefaults(urlString: String) {

    }
}

extension UIImageView {
    // MARK: - View Layer
    public func setImageViewLayer(cornerRadius: Int?, borderColor: UIColor?) {
        self.layer.borderWidth  = 1;
        self.layer.cornerRadius = CGFloat(cornerRadius!);
        self.layer.borderColor  = borderColor?.cgColor;
    }
    
    public func setImageViewLayerToRounded() {
        
    }
        
    // MARK: - View Animations
    public func configureImageViewAnimation(animationDuration: TimeInterval, animationRepeatCount: Int) {
        
        self.startAnimating();
    }
}
