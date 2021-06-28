//
//  FriendsTableViewCell.swift
//  VK app
//
//  Created by Maxim Bekmetov on 27.06.2021.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    @IBOutlet weak var firstNameNew: UILabel!
    @IBOutlet weak var lastNameNew: UILabel!
    
    @IBOutlet weak var photoNew: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
