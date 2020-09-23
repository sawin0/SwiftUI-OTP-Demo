//
//  CustomTextField.swift
//  OTP Demo SwiftUI
//
//  Created by Sabin Ranabhat on 9/23/20.
//  Copyright © 2020 Sabin Ranabhat. All rights reserved.
//

import SwiftUI
import UIKit

struct CustomTextField: UIViewRepresentable {
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String
        @Binding var nextResponder: Bool?
        @Binding var isResponder: Bool?
        @Binding var previousResponder: Bool?
        
        init(text: Binding<String>, nextResponder: Binding<Bool?>, isResponder: Binding<Bool?>, previousResponder: Binding<Bool?>) {
            _text = text
            _isResponder = isResponder
            _nextResponder = nextResponder
            _previousResponder = previousResponder
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
            
            if textField.text == ""{
                DispatchQueue.main.async {
                    self.isResponder = false
                    self.nextResponder = false
                    if self.previousResponder != nil {
                        self.previousResponder = true
                    }
                }
            }
            
            if text.count >= 1 {
                DispatchQueue.main.async {
                    self.text = String(self.text.suffix(1))
                    self.isResponder = false
                    if self.nextResponder != nil {
                        self.nextResponder = true
                    }
                }
            }
        }
        
    }
    
    @Binding var text: String
    @Binding var nextResponder: Bool?
    @Binding var isResponder: Bool?
    @Binding var previousResponder: Bool?
    
    func makeUIView(context: UIViewRepresentableContext<CustomTextField>) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.keyboardType = .numberPad
        textField.delegate = context.coordinator
        textField.font = UIFont.systemFont(ofSize: 40.0)
        textField.textColor = .black
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }
    
    func makeCoordinator() -> CustomTextField.Coordinator {
        return Coordinator(text: $text, nextResponder: $nextResponder, isResponder: $isResponder, previousResponder: $previousResponder)
    }
    
    func updateUIView(_ uiView: UITextField, context _: UIViewRepresentableContext<CustomTextField>) {
        uiView.text = text
        if isResponder ?? false {
            uiView.becomeFirstResponder()
        }
    }
}

