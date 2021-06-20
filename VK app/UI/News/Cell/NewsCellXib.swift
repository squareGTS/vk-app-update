//
//  NewsCellXib.swift
//  VK app
//
//  Created by Maxim Bekmetov on 18.05.2021.
//

import UIKit

class NewsCellXib: UITableViewCell {
    
    static let reusedId = "NewsCellXib"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var likeControl: LikeControl!
    @IBOutlet weak var comentControl: LikeControl!
    
    override func prepareForReuse() {
        titleLabel.text = ""
        photoImage.image = UIImage(named: "PlaceHolderImage")
    }
    
    func configure(_ news: News) {
        titleLabel.text = news.title
        dateLabel.text = news.date
        
        if let image = news.avatar {
            avatarImage.image = image
        } else {
            avatarImage.image = UIImage(named: "PlaceHolderImage")
        }
        
        if let image = news.photo[0].photos {
            photoImage.image = image
        } else {
            photoImage.image = UIImage(named: "PlaceHolderImage")
        }
    }
}
