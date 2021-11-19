//
//  ProfileViewController.swift
//  HomeChat
//
//  Created by Булат Хабибуллин on 19.11.2021.
//

import Foundation
import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: Private Properties
    
    private let cityNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Habibi-Regular", size: 16)!
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private let logoutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.layer.cornerRadius = 36 / 2
        button.layer.borderWidth = 1
        button.setImage(UIImage(named: "Vector"), for: .normal)
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(UIColor(named: "logoutButtonColor"), for: .normal)
        button.titleLabel?.font = UIFont(name: "Habibi-Regular", size: 14)!
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.adjustsImageSizeForAccessibilityContentSizeCategory = true
        button.addTarget(self, action: #selector(logoutAction), for: .touchUpInside)
        return button
    }()
    
    // MARK: Private
    
    private func setupNavBar() {
        navigationItem.title = "Alex Tsimikas"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = .init(title: "Messages",
                                                  style: .plain,
                                                  target: self,
                                                  action: #selector(pushToMessages))
        navigationItem.rightBarButtonItem?.setTitleTextAttributes([.font: UIFontMetrics(forTextStyle: .body).scaledFont(for: UIFont.init(name: "Habibi-Regular", size: 17)!)], for: .normal)
        navigationItem.rightBarButtonItem?.setTitleTextAttributes([.font: UIFontMetrics(forTextStyle: .body).scaledFont(for: UIFont.init(name: "Habibi-Regular", size: 17)!)], for: .highlighted)
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = UIColor(named: "logoutButtonColor")
    }
    
    private func setupLogButton() {
        view.addSubview(logoutButton)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoutButton.heightAnchor.constraint(equalToConstant: 36).isActive = true
        logoutButton.widthAnchor.constraint(equalToConstant: 143).isActive = true
        logoutButton.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 101).isActive = true
        logoutButton.imageView?.widthAnchor.constraint(equalToConstant: 12).isActive = true
        logoutButton.titleLabel?.centerYAnchor.constraint(equalTo: logoutButton.centerYAnchor).isActive = true
        logoutButton.titleLabel?.trailingAnchor.constraint(equalTo: logoutButton.trailingAnchor, constant: 65).isActive = true
        logoutButton.imageView?.trailingAnchor.constraint(equalTo: logoutButton.leadingAnchor, constant: 44).isActive = true
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        cityNameLabel.text = "Brooklyn, NY"
        
        view.addSubview(cityNameLabel)
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25).isActive = true
        cityNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 19).isActive = true
        setupLogButton()
    }
    
    @objc private func pushToMessages() {
        let viewController = ChatsListController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func logoutAction() {}
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavBar()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if previousTraitCollection?.userInterfaceStyle == .dark {
            logoutButton.layer.borderColor = UIColor.black.cgColor
        } else {
            logoutButton.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    
}
