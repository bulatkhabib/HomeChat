//
//  MessageCell.swift
//  HomeChat
//
//  Created by Булат Хабибуллин on 06.10.2021.
//

import UIKit

class MessageCell: UITableViewCell {
    
    private let messageView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        return view
    }()
    
    private let messageTextLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Habibi-Regular", size: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Habibi-Regular", size: 12)
        return label
    }()
    
    private let photoView = UIImageView()
    
    private var trailingConstraint: NSLayoutConstraint!
    private var leadingConstraint: NSLayoutConstraint!
    
    private func messageLeftConstraint() {
        messageTextLabel.textColor = UIColor(named: "leftMessageColor")
        messageView.backgroundColor = UIColor(named: "leftMessageViewColor")
        dateLabel.textColor = UIColor(named: "leftDateColor")
        
        photoView.isHidden = false
        trailingConstraint.isActive = false
        leadingConstraint.isActive = true
    }
    
    private func messageRightConstraint() {
        messageTextLabel.textColor = UIColor(named: "rightMessageColor")
        messageView.backgroundColor = UIColor(named: "rightMessageViewColor")
        dateLabel.textColor = UIColor(named: "rightDateColor")
        
        photoView.isHidden = true
        trailingConstraint.isActive = true
        leadingConstraint.isActive = false
    }
    
    var chatMessageModel: MessageModel! {
        didSet {
            messageTextLabel.text = chatMessageModel.description
            dateLabel.text = Date.getDateInString(date: chatMessageModel.date)
            if chatMessageModel.myMessage {
                messageRightConstraint()
            } else {
                messageLeftConstraint()
                photoView.image = chatMessageModel.image
            }
        }
    }
    
    private func setupConstraints() {
        photoView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        photoView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 19).isActive = true
        photoView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        photoView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        messageTextLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        self.bottomAnchor.constraint(equalTo: messageTextLabel.bottomAnchor, constant: 28).isActive = true
        messageTextLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 268).isActive = true
        
        messageTextLabel.topAnchor.constraint(equalTo: messageView.topAnchor, constant: 4).isActive = true
        messageTextLabel.leadingAnchor.constraint(equalTo: messageView.leadingAnchor, constant: 8).isActive = true
        messageView.bottomAnchor.constraint(equalTo: messageTextLabel.bottomAnchor, constant: 4).isActive = true
        messageView.trailingAnchor.constraint(equalTo: messageTextLabel.trailingAnchor, constant: 8).isActive = true
        
        dateLabel.topAnchor.constraint(equalTo: messageView.bottomAnchor, constant: 4).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: messageView.trailingAnchor).isActive = true
    }
    
    private func addSubviews() {
        self.addSubview(messageView)
        self.addSubview(messageTextLabel)
        self.addSubview(dateLabel)
        self.addSubview(photoView)
    }
    
    private func setupViews() {
        messageTextLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        messageView.translatesAutoresizingMaskIntoConstraints = false
        photoView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubviews()
        setupConstraints()
        
        leadingConstraint = messageTextLabel.leadingAnchor.constraint(equalTo: photoView.trailingAnchor, constant: 12)
        leadingConstraint.isActive = false
        
        trailingConstraint = self.trailingAnchor.constraint(equalTo: messageTextLabel.trailingAnchor, constant: 28)
        trailingConstraint.isActive = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
