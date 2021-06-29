//
//  GroupsTableViewCell.swift
//  VK app
//
//  Created by Maxim Bekmetov on 29.06.2021.
//

import UIKit

class GroupsTableViewCell: UITableViewCell {

    @IBOutlet weak var groupPhoto: UIImageView!
    @IBOutlet weak var nameOfGroup: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        //Configure the view for the selected state
    }
}
