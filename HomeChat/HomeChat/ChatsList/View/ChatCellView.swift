//
//  ChatCellModel.swift
//  HomeChat
//
//  Created by Булат Хабибуллин on 19.11.2021.
//

import Foundation
import UIKit

class ChatCellView: UITableViewCell {
    
    static let cellIdentifier = "chatCellIdentifier"
    
    // MARK: Priavte Properties
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Habibi-Regular", size: 14)!
        label.adjustsFontForContentSizeCategory = true

        return label
    }()
    
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let lastMessageLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "lastMessageColor")
        label.font = UIFont(name: "Habibi-Regular", size: 14)!
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont(name: "Habibi-Regular", size: 12)!
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    // MARK: Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Func
    
    func setData(data: ChatListModel.ChatName) {
        nameLabel.text = data.firstName + " " + data.lastName
        photoImageView.image = data.profileImage
        lastMessageLabel.text = data.message
        dateLabel.text = data.date
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.layer.cornerRadius = photoImageView.frame.height / 2
    }
    
    private func setupView() {
        self.addSubview(photoImageView)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        photoImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, lastMessageLabel])
            stackView.axis = .vertical
            stackView.spacing = 4
        
        self.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: super.topAnchor, constant: 24).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: -24).isActive = true
        
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 8).isActive = true
        stackView.topAnchor.constraint(equalTo: super.topAnchor, constant: 24).isActive = true
        stackView.bottomAnchor.constraint(equalTo: super.bottomAnchor, constant: -24).isActive = true
        
    }
}
