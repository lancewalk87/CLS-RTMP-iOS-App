//
//  TextFields.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 8/26/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

// MARK: - Class Properties
public enum Fields: Int {
    case emailEngaged       = 0
    case passwordEngaged    = 1
    case fullnameEngaged    = 2
    case birthdateEngaged   = 3
    case addressEngaged     = 4
    case postcodeEngaged    = 5
    case cityEngaged        = 6
    case stateEngaged       = 7
}

public enum FieldType {
    case email
    case number
    case url
    case standard
    case password
    case date
    case picker
}

public struct FieldStructure {
    var placeholder:        String?
    var tintColor:          UIColor?
    var textColor:          UIColor?
    var backgroundColor:    UIColor?
    var textAlignment:      NSTextAlignment    = .left
    var textPadding:        UIEdgeInsets?      = .zero
    
    init(
        placeholder:        String,
        tintColor:          UIColor?,
        textColor:          UIColor,
        backgroundColor:    UIColor,
        textAlignment:      NSTextAlignment    = .left,
        textPadding:        UIEdgeInsets       = .zero
    ) { // View Attributes:
        self.placeholder        = placeholder
        self.tintColor          = tintColor
        self.textColor          = textColor
        self.backgroundColor    = backgroundColor
        self.textAlignment      = textAlignment
        self.textPadding        = textPadding
    }
}

open class TextField: UITextField {
    // MARK: - Properties
    var inputStruct:    FieldStructure;
    var inputType:      FieldType;
    var inputTag:       Fields;
    
    var padding: UIEdgeInsets? = .zero;

    // MARK: - Initializers
    required public init(
        inputStruct:    FieldStructure?,
        inputType:      FieldType?,
        inputTag:       Fields?
    ) {
        self.inputStruct    = inputStruct!;
        self.inputType      = inputType!;
        self.inputTag       = inputTag!;
        
        super.init(frame: .zero);
        self.tag = self.inputTag.rawValue;
        
        setter(structure: self.inputStruct, complete: { done in
            let properties = InputProperties(fieldType: inputType!);
            self.inputView                  = properties.inputView;
            self.keyboardType               = properties.keyboardType!;
            self.isSecureTextEntry          = properties.isSecureText!;
            self.autocapitalizationType     = properties.autoCap;
            self.spellCheckingType          = properties.willSpellCheck!;
            
            let tb = UIToolbar(); tb.sizeToFit()
            tb.setItems([
                UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(endEntry)),
                UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil),
                UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelEntry))
            ], animated: false);
            self.inputAccessoryView = tb;
        });
    }
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented"); }
    
    // MARK: - Setters
    func setter(structure: FieldStructure, complete: (Bool) -> Void) {
        self.placeholder        = structure.placeholder
        self.tintColor          = structure.tintColor
        self.textColor          = structure.textColor
        self.backgroundColor    = structure.backgroundColor
        self.textAlignment      = .left;
        self.padding            = structure.textPadding;
        complete(true);
    }
    
    struct InputProperties {
        var keyboardType:   UIKeyboardType? = .default;
        var isSecureText:   Bool? = false;
        var inputView:      UIView? = nil;
        var autoCap:        UITextAutocapitalizationType = .sentences;
        var willSpellCheck: UITextSpellCheckingType? = .yes;
        
        init(fieldType: FieldType) {
            switch fieldType {
            case .email:    keyboardType = .emailAddress; autoCap = .none;
            case .number:   keyboardType = .numberPad;
            case .url:      keyboardType = .URL;
            case .standard: keyboardType = .default;
            case .password: isSecureText = true;
            case .date:
                inputView = DatePicker();
                
            
            case .picker:   inputView = PickerView();
            }
        }
    }
    
    // MARK: - TextField Overrides
    override open func willMove(toSuperview newSuperview: UIView?) {
        if newSuperview != nil {
            
        } else {
            
        }
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding!);
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding!);
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding!);
    }
}

extension TextField {
    func cancelEntry() {
        
    }
    
    func endEntry() {
        
    }
    
    // MARK: - TextField Layer
    public func setTextFieldLayer(cornerRadius: Int?, borderColor: UIColor?) {
        self.layer.borderWidth  = 1;
        self.layer.cornerRadius = CGFloat(cornerRadius!);
        self.layer.borderColor  = borderColor?.cgColor;
    }
}

