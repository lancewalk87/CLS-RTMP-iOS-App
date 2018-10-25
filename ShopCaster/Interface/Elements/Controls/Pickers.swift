//
//  Pickers.swift
//  ShopCaster
//
//  Created by Lance T. Walker on 9/7/18.
//  Copyright © 2018 CodeLife-Productions. All rights reserved.
//

open class DatePicker: UIDatePicker {
    required public init() {
        super.init(frame: .zero);
        datePickerMode = .date;        
    }
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented"); }
}


open class PickerView: UIPickerView {
    required public init() {
        super.init(frame: .zero);
    }
    required public init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented"); }
}
