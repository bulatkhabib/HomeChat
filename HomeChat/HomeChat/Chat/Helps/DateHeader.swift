//
//  DateHeader.swift
//  HomeChat
//
//  Created by Булат Хабибуллин on 11.10.2021.
//

import Foundation
import UIKit

class DateHeader: UILabel {
    
    //MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        textColor = UIColor(named: "headerDateColor")
        font = UIFont.init(name: "Habibi-Regular", size: 12)
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var intrinsicContentSize: CGSize {
        let originalContentSize = super.intrinsicContentSize
        let height = originalContentSize.height + 12
        layer.cornerRadius = height / 2
        layer.masksToBounds = true

        return CGSize(width: originalContentSize.width + 20, height: height)
    }
}

extension Date {
    
    //MARK: - Static Methods
    
    static func getDateDay(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter.string(from: date)
    }
    
    static func getDateInString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm a"
        return formatter.string(from: date)
    }
}
