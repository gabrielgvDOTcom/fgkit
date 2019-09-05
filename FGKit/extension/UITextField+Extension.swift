//
//  UITextField+Extension.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 9/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

public extension UITextField {
    
    @IBInspectable var doneAccessory: Bool {
        get {
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone {
                addDoneButtonOnKeyboard()
            }
        }
    }
    
    func addDoneButtonOnKeyboard() {
        let doneToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        doneToolbar.sizeToFit()
        doneToolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        ]
        self.inputAccessoryView = doneToolbar
    }
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
    
    // MARK: - Styled -
    func style(_ style: Styled.TextField) {
        self.font = style.font
        self.tintColor = style.color
        self.textAlignment = style.align
        self.borderStyle = style.borderStyle
    }
}
