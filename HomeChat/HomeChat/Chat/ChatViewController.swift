//
//  ChatViewController.swift
//  HomeChat
//
//  Created by Булат Хабибуллин on 06.10.2021.
//

import UIKit

class ChatViewController: UIViewController {
    
    // MARK: Private properties
    
    private let tableView = UITableView()
    private let messageCellIdentifier = "messageCellIdentifier"
    private let writingTextFieldView = UIView()
    private let separator : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    var sectionMessages = [
        [ MessageModel(myMessage: false, description: "Alex, let’s meet this weekend. I’ll check with Dave too 😎", image: UIImage(named: "Profile Photo"), date: Date(timeIntervalSince1970: 1631635368.0)),
          MessageModel(myMessage: true, description: "Sure. Let’s aim for saturday", image: nil, date: Date(timeIntervalSince1970: 1631635668.0)),
          MessageModel(myMessage: true, description: "AI’m visiting mom this sunday 👻", image: nil, date: Date(timeIntervalSince1970: 1631635908.0)),
          MessageModel(myMessage: false, description: "Alrighty! Will give you a call shortly 🤗", image: UIImage(named: "Profile Photo"), date: Date(timeIntervalSince1970: 1631636448.0)),
          MessageModel(myMessage: true, description: "❤️", image: nil, date: Date(timeIntervalSince1970: 1631636748.0))
        ],
        [ MessageModel(myMessage: false, description: "Hey you! Are you there?", image: UIImage(named: "Profile Photo"), date: Date(timeIntervalSince1970: 1635751848.0)),
          MessageModel(myMessage: true, description: "👋 Hi Jess! What’s up?", image: nil, date: Date(timeIntervalSince1970: 1668751835000.0))
        ]
    ]
    
    private let writingTextField: ExpandedTextField = {
        let textField = ExpandedTextField()
        textField.backgroundColor = UIColor(named: "writingTextFieldColor")
        textField.font = UIFont.init(name: "Habibi-Regular", size: 14)
        textField.layer.cornerRadius = 20
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.systemGray,
            NSAttributedString.Key.font: UIFont(name: "Habibi-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16)
        ]
        textField.attributedPlaceholder = NSAttributedString(string: "Type your message here...", attributes: attributes)
        
        return textField
    }()
    
    private let sendButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "send"), for: .normal)
        button.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Jessica Thopmson"
        navigationItem.backButtonTitle = ""
        setupWritingTextField()
        setupTableView()
    }
    
    // MARK: Private
    
    private func setupWritingTextField() {
        view.addSubview(writingTextFieldView)
        writingTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        writingTextFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        writingTextFieldView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        writingTextFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        writingTextFieldView.heightAnchor.constraint(equalToConstant: 88).isActive = true
        
        writingTextFieldView.addSubview(writingTextField)
        writingTextField.translatesAutoresizingMaskIntoConstraints = false
        writingTextField.topAnchor.constraint(equalTo: writingTextFieldView.topAnchor, constant: 12).isActive = true
        writingTextField.leadingAnchor.constraint(equalTo: writingTextFieldView.leadingAnchor, constant: 16).isActive = true
        writingTextFieldView.bottomAnchor.constraint(equalTo: writingTextField.bottomAnchor, constant: 36).isActive = true
        writingTextFieldView.trailingAnchor.constraint(equalTo: writingTextField.trailingAnchor, constant: 16).isActive = true
        
        
        writingTextFieldView.addSubview(sendButton)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.topAnchor.constraint(equalTo: writingTextField.topAnchor, constant: 4).isActive = true
        sendButton.trailingAnchor.constraint(equalTo: writingTextField.trailingAnchor, constant: -4).isActive = true
        sendButton.widthAnchor.constraint(equalToConstant: 32).isActive = true
        sendButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        writingTextFieldView.addSubview(separator)
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.topAnchor.constraint(equalTo: writingTextFieldView.topAnchor).isActive = true
        separator.leadingAnchor.constraint(equalTo: writingTextFieldView.leadingAnchor).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 2).isActive = true
        separator.widthAnchor.constraint(equalTo: writingTextFieldView.widthAnchor).isActive = true
    }
    
    private func setupTableView() {
        
        tableView.register(MessageCell.self, forCellReuseIdentifier: messageCellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: writingTextField.topAnchor).isActive = true
        
        let upViewHeight = CGFloat(40)
        self.tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.bounds.size.width, height: upViewHeight))
        self.tableView.contentInset = UIEdgeInsets(top: -upViewHeight, left: 0, bottom: 0, right: 0)
        
    }
    
    private func setupDateContainerView(label: UILabel) -> UIView {
        
        let label = label
        
        let containerView = UIView()
        containerView.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        return containerView
    }
    
    @objc private func sendButtonTapped() {
        if let text = writingTextField.text, !text.isEmpty {
            writingTextField.text = ""
            
            sectionMessages[sectionMessages.count - 1].append(MessageModel(myMessage: true, description: text, image: nil, date: Date()))
            let indexPath = IndexPath(
                row: self.tableView.numberOfRows(inSection: sectionMessages.count - 1),
                section: sectionMessages.count - 1
            )
            
            self.tableView.reloadData()
            self.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
        }
    }
}

// MARK: Extension

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionMessages.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sectionMessages[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCellIdentifier", for: indexPath) as! MessageCell
        cell.selectionStyle = .none
        let sectionMessage = sectionMessages[indexPath.section][indexPath.row]
        cell.chatMessageModel = sectionMessage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let firstSectionMessage = sectionMessages[section].first {
            let dateInString = Date.getDateDay(date: firstSectionMessage.date)
            let label = DateHeader()
            let calendar = Calendar.current
            
            if calendar.isDateInToday(firstSectionMessage.date) {
                label.text = "TODAY"
            } else if calendar.isDateInYesterday(firstSectionMessage.date) {
                label.text = "YESTERDAY"
            } else {
                label.text = dateInString
            }
            return setupDateContainerView(label: label)
        }
        return nil
    }
    
}
