//
//  ChatTextSendView.swift
//  HomeChat
//
//  Created by Булат Хабибуллин on 01.11.2021.
//

import Foundation
import UIKit

class ExpandedTextField: UITextField {
    
    var padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
