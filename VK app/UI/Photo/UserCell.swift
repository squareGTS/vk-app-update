//
//  FriendCell.swift
//  VK app
//
//  Created by Maxim Bekmetov on 11.04.2021.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var photoOfFriend: UIImageView!
    @IBOutlet weak var labelOfFriend: UILabel!
    
    func configure(image: UIImage, name: String) {
        labelOfFriend.text = name
        photoOfFriend.image = image
    }
}
