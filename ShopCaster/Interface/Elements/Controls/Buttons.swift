//
//  Buttons.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 8/26/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

// MARK: - Class Properties
public enum Buttons: Int {
    case loginPressed       = 0
    case registerPressed    = 1
    case returnPressed      = 2
    case forgotPressed      = 3
    case facebookPressed    = 4
    case googlePressed      = 5
    case profilePressed     = 6
    case cancelPressed      = 7
    case commentPressed     = 8
    case sharePressed       = 9
    case likePressed        = 10
    case ordersPressed      = 11
    case settingsPressed    = 12
    case aboutPressed       = 13
}

class Button: UIButton {
    // MARK: - Intializers
    enum animations: Int {
        case onBeganTouchPop        = 0
        case onBeganTouchFade       = 1
        case onEndedTouchStandard   = 2
    }
    var animation: animations;
    var buttonTag: Buttons;

    required init(
        title:              String,
        titleColor:         UIColor,
        backgroundColor:    UIColor?,
        backgroundImage:    UIImage?,
        animationType:      animations?,
        buttonTag:          Buttons
    ) {
        self.animation = animationType!;
        self.buttonTag = buttonTag;
        super.init(frame: .zero);
        self.setTitle(title, for: .normal);
        self.setTitleColor(titleColor, for: .normal);
        self.titleLabel?.adjustsFontSizeToFitWidth = true;
        if backgroundColor != nil { self.backgroundColor = backgroundColor; }
        if backgroundImage != nil {
            self.setImage(backgroundImage, for: .normal);
            self.adjustsImageWhenHighlighted = false;
        }
    }
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented"); }
    
    // MARK: - Button Overrides
    open override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        animate(shouldStart: true, animationCompletion: { complete in
            super.beginTracking(touch, with: event);
        });
        return true;
    }
    
    open override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        animate(shouldStart: false, animationCompletion: { complete in
            super.endTracking(touch, with: event);
        });
    }
    
    // MARK: - Animations
    fileprivate func animate(shouldStart: Bool, animationCompletion: (Bool) -> Void) {
        switch self.animation {
        case .onBeganTouchPop: if shouldStart { self.pop(); } else { self.reversePop(); }; break;
        case .onBeganTouchFade: if shouldStart { self.fadeOut(); } else { self.fadeIn(); }; break;
        case .onEndedTouchStandard: break;
        }
        animationCompletion(true);
    }
}

extension Button {
    // MARK: - Button Layer
    public func setButtonLayer(cornerRadius: Int?, borderColor: UIColor?) {
        self.layer.borderWidth  = 1;
        self.layer.cornerRadius = CGFloat(cornerRadius!);
        self.layer.borderColor  = borderColor?.cgColor;
    }
    
    // MARK: - Modifiers
    public func changeEnabledState(shouldDisable: Bool) {
        if shouldDisable {
            self.isEnabled = false;
            self.alpha = 0.5;
        } else {
            self.fadeIn(0.15, delay: 0, completion: { complete in
                self.isEnabled = true;
            });
        }
    }
}

