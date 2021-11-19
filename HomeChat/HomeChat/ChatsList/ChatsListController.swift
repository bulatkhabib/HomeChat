//
//  ChatsListController.swift
//  HomeChat
//
//  Created by Булат Хабибуллин on 19.11.2021.
//

import Foundation
import UIKit

class ChatsListController: UIViewController {
    
    // MARK: Private properties
    
    private let search = UISearchController(searchResultsController: nil)
    private let tableView = UITableView()
    private var chatList: [ChatListModel.ChatName] = [
        .init(profileImage: UIImage(named: "Profile Photo"), firstName: "Jessica", lastName: "Thompson", date: "4h ago", message: "Hey you! Are u there?"),
        .init(profileImage: UIImage(named: "Profile Photo-2"), firstName: "Kat", lastName: "Williams", date: "5h ago", message: "OMG! OMG! OMG!"),
        .init(profileImage: UIImage(named: "Profile Photo-3"), firstName: "Jacob", lastName: "Washington", date: "20/9/21", message: "Sure. Sunday works for me!"),
        .init(profileImage: nil, firstName: "Leslie", lastName: "Alexander", date: "19/9/21", message: "Sent you an invite for next monday."),
        .init(profileImage: UIImage(named: "Profile Photo-4"), firstName: "Tony", lastName: "Monta", date: "19/9/21", message: "How’s Alicia doing? Ask her to give m...")
        ]
    
    // MARK: Private
    
    private func setupTableView() {
        view.backgroundColor = .systemBackground
        tableView.register(ChatCellView.self, forCellReuseIdentifier: ChatCellView.cellIdentifier)
        tableView.separatorStyle = .singleLine
        tableView.rowHeight = UITableView.automaticDimension
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.reloadData()
    }
    
    private func setupNavBar() {
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = "MESSAGES"
        navigationItem.searchController = search
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        let searchPlaceholderMutableString = NSMutableAttributedString(
            string: "Who do you want to chat with?",
            attributes: [
                .font : UIFont(name: "Habibi-Regular", size: 17)!,
                .foregroundColor: UIColor.gray
            ]
        )
        search.searchBar.searchTextField.attributedPlaceholder = searchPlaceholderMutableString
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        setupTableView()
        setupNavBar()
    }
}

extension ChatsListController: UITableViewDataSource, UITableViewDelegate {

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         chatList.count
     }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatCellView.cellIdentifier) as? ChatCellView else { return UITableViewCell() }

         let chat = chatList[indexPath.row]
         cell.setData(data: chat)
         cell.separatorInset = .zero

         return cell

     }

     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.deselectRow(at: indexPath, animated: true)
         self.navigationController?.pushViewController(ChatViewController(), animated: true)
     }

 }
