//
//  Labels.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 8/26/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

class Label: UILabel {
    // MARK: - Initializers
    enum style {
        case lined
        case underlined
        case overlined
        case none
    }
    var labelStyle: style;
    
    required init(
        labelStyle: style,
        text: String?,
        titleColor: UIColor,
        backgroundColor: UIColor
    ) {
        self.labelStyle = labelStyle;
        super.init(frame: .zero);
        self.text = text;
        self.textColor = titleColor;
        self.backgroundColor = backgroundColor;
        self.adjustsFontSizeToFitWidth = true;
        self.textAlignment = .center;
    }
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented"); }
}

extension Label {
    // MARK: - Label Layer
    static func drawLabelTo() {
        
//        switch sel {
//        case .lined:
//            break;
//        case .underlined: break;
//        case .overlined: break;
//        }
    }
//
    
//    func drawLineOnBothSides(color: UIColor) {
//        let widthOfString = text?.sizeOfString(OfFont: self.font).width;
//        //        let width = CGFloat(2);
////
////        let leftLine = UIView(frame: CGRect(
////            x: 0,
////            y: frame.height/2 - width/2,
////            width: frame.width/2 - widthOfString!/2 - 10,
////            height: width
////        ));
////        leftLine.backgroundColor = color;
////        self.addSubview(leftLine);
////
////        let rightLine = UIView(frame: CGRect(
////            x: frame.width/2 + widthOfString!/2 + 10,
////            y: frame.height/2 - width/2,
////            width: frame.width/2 - widthOfString!/2 - 10,
////            height: width
////        ));
////        rightLine.backgroundColor = color;
////        self.addSubview(rightLine);
//    }
}
