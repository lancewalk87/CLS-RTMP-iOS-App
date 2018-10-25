//
//  UIViewExt.swift 
//  ShopCaster
//
//  Created by Lance T. Walker on 7/25/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

// MARK: - Frame Extensions
extension UIView {
    // MARK: - Frame getters/setters
    public var x: CGFloat {
        get { return self.frame.origin.x;
        } set(float) { self.frame = CGRect(x: float, y: self.y, width: self.width, height: self.height); }
    }
    public var y: CGFloat {
        get { return self.frame.origin.y;
        } set(float) { self.frame = CGRect(x: self.x, y: float, width: self.width, height: self.height); }
    }
    public var width: CGFloat {
        get { return self.frame.size.width;
        } set(float) { self.frame = CGRect(x: self.x, y: self.y, width: float, height: self.height); }
    }
    public var height: CGFloat {
        get { return self.frame.height;
        } set(float) { self.frame = CGRect(x: self.x, y: self.y, width: self.width, height: float); }
    }
    public var left: CGFloat {
        get { return self.x;
        } set(float) { self.x = float; }
    }
    public var right: CGFloat {
        get { return self.x + self.width;
        } set(float) { self.x = float - self.width; }
    }
    public var top: CGFloat {
        get { return self.y;
        } set(float) { self.y = float; }
    }
    public var bottom: CGFloat {
        get { return self.y + self.height;
        } set(float) { self.y = float - self.height; }
    }
    public var origin: CGPoint {
        get { return self.frame.origin;
        } set(pointMake) { self.frame = CGRect(origin: pointMake, size: self.frame.size); }
    }
    public var centerX: CGFloat {
        get { return self.center.x;
        } set(float) { self.center.x = float; }
    }
    public var centerY: CGFloat {
        get { return self.center.y;
        } set(float) { self.center.y = float; }
    }
    public var size: CGSize {
        get { return self.frame.size;
        } set(pointMake) { self.frame = CGRect(origin: self.frame.origin, size: pointMake); }
    }
    
    func rootView() -> UIView {
        guard let parentView = superview else { return self; }
        return parentView.rootView();
    }
    
    // MARK: Frame Offsets
    public func topOffset(_ offset: CGFloat) -> CGFloat     { return self.top - offset;     }
    public func leftOffset(_ offset: CGFloat) -> CGFloat    { return self.left - offset;    }
    public func bottomOffset(_ offset: CGFloat) -> CGFloat  { return self.bottom + offset;  }
    public func rightOffset(_ offset: CGFloat) -> CGFloat   { return self.right + offset;   }
    
    // MARK: Frame Alignment
    public func alignRight(_ offset: CGFloat) -> CGFloat    { return self.width - offset; }
    public func alignLeft(_ offset: CGFloat) -> CGFloat     { return self.width + offset; }
    
    // MARK: Frame Anchor
    public func fillSuperview() {
        let parentView = rootView();
        anchor(
            top:        parentView.safeAreaLayoutGuide.topAnchor,
            leading:    parentView.safeAreaLayoutGuide.leadingAnchor,
            bottom:     parentView.safeAreaLayoutGuide.bottomAnchor,
            trailing:   parentView.safeAreaLayoutGuide.trailingAnchor,
            centerX:    nil,
            centerY:    nil,
            size:       .init(width: parentView.frame.width, height: parentView.frame.height),
            padding:    .init(top: 0, left: 0, bottom: 0, right: 0)
        );
    }
    
    func addConstraintsWithFormat(_ format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }

    public func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?,centerX: NSLayoutXAxisAnchor?, centerY: NSLayoutYAxisAnchor?, size: CGSize = .zero, padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false;
        
        // Anchor Points
        if let top=top { topAnchor.constraint(equalTo: top, constant: padding.top).isActive=true;}
        if let leading=leading { leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive=true; }
        if let bottom=bottom { bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive=true; }
        if let trailing=trailing { trailingAnchor.constraint(equalTo: trailing, constant:-padding.right).isActive=true; }
        if let centerX=centerX { centerXAnchor.constraint(equalTo: centerX).isActive = true; }
        if let centerY=centerY { centerYAnchor.constraint(equalTo: centerY, constant: padding.top).isActive = true; }
        
        constraintToSize(size: size);
    }
    
    public func constraintToSize(size: CGSize = .zero) {
        if size.width != 0 { widthAnchor.constraint(equalToConstant: size.width).isActive = true; }
        if size.height != 0 { heightAnchor.constraint(equalToConstant: size.height).isActive = true; }
    }

    // MARK: - Subview Managers
    public func appendSelectSubViews(viewsToAppend: [UIView]=[], subViewsAppended: (Bool) -> Void) {
        var curentHeight: CGFloat = self.height;
        for subView in viewsToAppend {
            self.addSubview(subView);
            curentHeight += subView.frame.height;
        }
        subViewsAppended(true);
    }
    
    public func removeSelectSubviews(tagsToRemove: [Int]=[]) -> CGFloat {
        var currentHeight: CGFloat = self.height;
        for subView in subviews {
            if tagsToRemove.contains(subView.tag) && !(subView).isHidden {
                subView.removeFromSuperview();
                currentHeight -= subView.frame.height;
            }
        }
        return currentHeight;
    }

    public func removeSubviews() {
        for subView in subviews { subView.removeFromSuperview(); }
    }
    
    public func resignAllResponders() {
        subviews.forEach {
            if let input = $0 as? UITextField {
                if input.isFirstResponder { input.resignFirstResponder(); }
            }
        }
    }
    
    // MARK - Subview Framing
    public func centerXInSuperView() {
        guard let parentView = superview else {
            assertionFailure("Subview Framing Error: subview: \(self) doesn't have a superview");
            return;
        }
        self.x = parentView.width/2 - self.width/2;
    }
    
    public func centerYInSuperView() {
        guard let parentView = superview else {
            assertionFailure("Subview Framing Error: subview: \(self) doesn't have a superview");
            return;
        }
        self.y = parentView.height/2 - self.height/2;
    }
    
    public func centerInSuperview() {
        self.centerXInSuperView();
        self.centerYInSuperView();
    }
}

// MARK: - Transformation Extensions
extension UIView {
    // MARK: - Rotation
    public func setRotationX(_ x: CGFloat) {
        var transform = CATransform3DIdentity;
        transform.m34 = 1.0 / -1000.0;
        transform = CATransform3DRotate(transform, degreesToRadians(degrees: x), 1.0, 0.0, 0.0);
        self.layer.transform = transform;
    }
    
    public func setRotationY(_ y: CGFloat) {
        var transform = CATransform3DIdentity;
        transform.m34 = 1.0 / -1000.0;
        transform = CATransform3DRotate(transform, degreesToRadians(degrees: y), 0.0, 1.0, 0.0);
        self.layer.transform = transform;
    }
    
    public func setRotationZ(_ z: CGFloat) {
        var transform = CATransform3DIdentity;
        transform.m34 = 1.0 / -1000.0;
        transform = CATransform3DRotate(transform, degreesToRadians(degrees: z), 0.0, 0.0, 1.0);
        self.layer.transform = transform;
    }
    
    public func setRotation(x: CGFloat, y: CGFloat, z: CGFloat) {
        var transform = CATransform3DIdentity;
        transform.m34 = 1.0 / -1000.0;
        transform = CATransform3DRotate(transform, degreesToRadians(degrees: x), 1.0, 0.0, 0.0);
        transform = CATransform3DRotate(transform, degreesToRadians(degrees: y), 0.0, 1.0, 0.0);
        transform = CATransform3DRotate(transform, degreesToRadians(degrees: z), 0.0, 0.0, 1.0);
        self.layer.transform = transform;
    }
    
    public func setScale(x: CGFloat, y: CGFloat) {
        var transform = CATransform3DIdentity;
        transform.m34 = 1.0 / -1000.0;
        transform = CATransform3DScale(transform, x, y, 1);
        self.layer.transform = transform;
    }
    
    // MARK: - Converters
    fileprivate func degreesToRadians(degrees: CGFloat) -> CGFloat { return degrees * CGFloat.pi / 180; }
    fileprivate func radiansToDegress(radians: CGFloat) -> CGFloat { return radians * 180 / CGFloat.pi; }
}

// MARK: - Layer Extensions
extension UIView {
    // MARK: - Borders
    public func setCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius     = radius;
        self.layer.masksToBounds    = true;
    }
    
    public func addShadow(offset: CGSize, radius: CGFloat, color: UIColor, opacity: Float, cornerRadius: CGFloat? = nil) {
        self.layer.shadowOffset = offset;
        self.layer.shadowRadius = radius;
        self.layer.shadowOpacity = opacity;
        self.layer.shadowColor = color.cgColor;
        if let r = cornerRadius { self.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: r).cgPath; }
    }
    
    public func addBorder(borderSide: UIRectEdge, width: CGFloat, color: UIColor) {
        let border = CALayer();
        border.backgroundColor = color.cgColor;
        switch borderSide {
        case .top:      border.frame = CGRect(x: 0, y: 0, width: frame.width, height: width);                   break;
        case .left:     border.frame = CGRect(x: 0, y: 0, width: width, height: frame.height);                  break;
        case .bottom:   border.frame = CGRect(x: 0, y: frame.height-width, width: frame.width, height: width);  break;
        case .right:    border.frame = CGRect(x: frame.width-width, y: 0, width: width, height: frame.height);  break;
        default: break;
        }
        layer.addSublayer(border);
    }
    
    // MARK: - Gradients
    public func addGradient(side: UIRectEdge, reach: CGFloat, colors: NSArray) {
        let gradient: CAGradientLayer = CAGradientLayer();
        gradient.colors = colors as! [Any];
        gradient.locations = [ 0.0, 1.0 ];
    
        switch side {
        case .top: gradient.frame = CGRect(x: 0, y: frame.height, width: frame.width, height: frame.height-reach); break;
        case .left: gradient.frame = CGRect(x: 0, y: 0, width: reach, height: frame.height); break;
        case .bottom: gradient.frame = CGRect(x: 0, y: 0, width: frame.width, height: reach); break;
        case .right: gradient.frame = CGRect(x: frame.width, y: 0, width: frame.width-reach, height: frame.height); break;
        default: break;
        }
        
        self.layer.insertSublayer(gradient, at: 1);
    }
    
    public func removeGradient(shouldRemoveAll: Bool? = false, atLayer: Int?) {
        
    }
}

// MARK: - Animation Extensions
private let ViewAnimationDuration:          TimeInterval = 1;
private let ViewAnimationBounceDamping:     CGFloat = 0.5;
private let ViewAnimationBounceVelocity:    CGFloat = 0.5;

public let ViewDefaultFadeDuration:         TimeInterval = 0.1;

extension UIView {
    // MARK: - Animation Handlers
    public func spring(animations: @escaping (() -> Void), completion: ((Bool) -> Void)? = nil) {
        spring(duration: ViewAnimationDuration, animations: animations, completion: completion);
    }

    public func spring(duration: TimeInterval, animations: @escaping (() -> Void), completion: ((Bool) -> Void)? = nil) {
        UIView.animate(
            withDuration: ViewAnimationDuration,
            delay: 0,
            usingSpringWithDamping: ViewAnimationBounceDamping,
            initialSpringVelocity: ViewAnimationBounceVelocity,
            options: UIViewAnimationOptions.allowAnimatedContent,
            animations: animations,
            completion: completion
        );
    }
    
    public func animate(duration: TimeInterval, animations: @escaping (() -> Void), completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration, animations: animations, completion: completion);
    }
    
    public func animate(animations: @escaping (() -> Void), completion: ((Bool) -> Void)? = nil) {
        animate(duration: ViewAnimationDuration, animations: animations, completion: completion);
    }
    
    // MARK: - Transistion Animations
    public func fadeIn(_ duration: TimeInterval? = ViewDefaultFadeDuration, delay: TimeInterval? = 0.0, completion: ((Bool) -> Void)? = nil) {
        fadeTo(1.0, duration: duration, delay: delay, completion: completion);
    }
    
    public func fadeOut(_ duration: TimeInterval? = ViewDefaultFadeDuration, delay: TimeInterval? = 0.0, completion: ((Bool) -> Void)? = nil) {
        fadeTo(0.0, duration: duration, delay: delay, completion: completion);
    }
    
    public func fadeTo(_ value: CGFloat, duration: TimeInterval? = ViewDefaultFadeDuration, delay: TimeInterval? = 0.0, completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration ?? ViewDefaultFadeDuration, delay: delay ?? ViewDefaultFadeDuration, options: .curveEaseInOut, animations: {
            self.alpha = value;
        }, completion: completion);
    }
    
    public func dismissViewWithGrouping(viewsToDisplace: [UIView]=[]) {
//        let toDismiss: UIView = viewsToDisplace[0];
//        for i in viewsToDisplace {
////            i.spring(duration: 1.0, animations: { transform = CGAffineTransform(scaleX: 0.8, y: 0.8) }, compl
//        }
    }
    
    public func applyTransformation(isDismissing: Bool?, transformation: CGAffineTransform?) {
//        let anim = CAKeyframeAnimation(keyPath: "transform");
//        anim.values = [
//            NSValue(caTransform3D: CATransform3DMakeTranslation(-5, 0, 0 )),
//            NSValue(caTransform3D: CATransform3DMakeTranslation( 5, 0, 0 ))
//        ];
//        anim.autoreverses = true;
//        anim.repeatCount = Float(4);
//        anim.duration = 7/100;
//        self.layer.add(anim, forKey: nil);
        UIView.animate(withDuration: 1.0, animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: 0.0, y: 1);
        });
    }
    
    // MARK: - Subview Animations
    public func pop() {
        UIView.animate(withDuration: 0.1, animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8);
        });
    }
    
    public func popMid() {
        setScale(x: 1.25, y: 1.25);
        spring(duration: 0.2, animations: { [unowned self] () -> Void in
            self.setScale(x: 1, y: 1);
        });
    }
    
    public func reversePop() {
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.2,
            initialSpringVelocity: 6.0,
            options: UIViewAnimationOptions.allowUserInteraction,
            animations: { () -> Void in
                self.transform = CGAffineTransform.identity;
        });
    }
    
    public func shakeViewForTimes(_ times: Int) {
        let anim = CAKeyframeAnimation(keyPath: "transform");
        anim.values = [
            NSValue(caTransform3D: CATransform3DMakeTranslation(-5, 0, 0 )),
            NSValue(caTransform3D: CATransform3DMakeTranslation( 5, 0, 0 ))
        ];
        anim.autoreverses = true;
        anim.repeatCount = Float(times);
        anim.duration = 7/100;
        self.layer.add(anim, forKey: nil);
    }
}

// MARK: - Render Extensions
extension UIView {
    // MARK: - Render Types
    public func renderToImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, 0.0);
        drawHierarchy(in: bounds, afterScreenUpdates: false);
        let img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return img!;
    }
}

// MARK: - Actions
extension UIView {
    // MARK: - Gestures
    public func addTapGesture(tapNumber: Int = 1, target: AnyObject, action: Selector) {
        let tap = UITapGestureRecognizer(target: target, action: action);
        tap.numberOfTapsRequired = tapNumber;
        addGestureRecognizer(tap);
        isUserInteractionEnabled = true;
    }
    
    public func addSwipeGesture(direction: UISwipeGestureRecognizerDirection, numberOfTouches: Int = 1, target: AnyObject, action: Selector) {
        let swipe = UISwipeGestureRecognizer(target: target, action: action);
        swipe.direction = direction;
        #if os(iOS)
        swipe.numberOfTouchesRequired = numberOfTouches;
        #endif
        addGestureRecognizer(swipe);
        isUserInteractionEnabled = true;
    }

    public func addPanGesture(target: AnyObject, action: Selector) {
        let pan = UIPanGestureRecognizer(target: target, action: action);
        addGestureRecognizer(pan);
        isUserInteractionEnabled = true;
    }
    
    #if os(iOS)
    public func addPinchGesture(target: AnyObject, action: Selector) {
        let pinch = UIPinchGestureRecognizer(target: target, action: action);
        addGestureRecognizer(pinch);
        isUserInteractionEnabled = true;
    }
    #endif
    
    // MARK: - Press Gesture
    public func addLongPressGesture(target: AnyObject, action: Selector) {
        let longPress = UILongPressGestureRecognizer(target: target, action: action);
        addGestureRecognizer(longPress);
        isUserInteractionEnabled = true;
    }
    
    // MARK: - Notifications
//    private enum:
    public func addKeyboardObservers(action: Selector) {
//        NotificationCenter.default.addObserver(self, selector: #selector(action), name: .UIKeyboardWillShow, object: nil);
//        NotificationCenter.default.addObserver(self, selector: #selector(action), name: .UIKeyboardWillHide, object: nil);
    }
    
    public func removeKeyboardObservers() {
        
    }
}

// MARK: - Masking Extensions
extension UIView {
    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius));
        let mask = CAShapeLayer();
        mask.path = path.cgPath;
        self.layer.mask = mask;
    }
    
    public func roundView(withBorderColor color: UIColor? = nil, withBorderWidth width: CGFloat? = nil) {
        self.setCornerRadius(radius: min(self.frame.size.height, self.frame.size.width) / 2);
        self.layer.borderWidth = width ?? 0;
        self.layer.borderColor = color?.cgColor ?? UIColor.clear.cgColor;
    }
    
    public func nakedView() {
        self.layer.mask = nil;
        self.layer.borderWidth = 0;
    }
}
