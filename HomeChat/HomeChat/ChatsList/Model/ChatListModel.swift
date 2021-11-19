//
//  ChatListModel.swift
//  HomeChat
//
//  Created by Булат Хабибуллин on 19.11.2021.
//

import Foundation
import UIKit

struct ChatListModel {
    
    let chatList: [ChatName]
    
    struct ChatName {
        let profileImage: UIImage?
        let firstName: String
        let lastName: String
        let date: String
        let message: String
    }
}
