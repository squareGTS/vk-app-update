//
//  PhotosCell.swift
//  VK app
//
//  Created by Maxim Bekmetov on 11.04.2021.
//

import UIKit

class FriendPhotoCell: UICollectionViewCell {
    
    var likeControlTapped: ((Int) -> Void)?
    
    @IBOutlet weak var friendsPhotoImage: UIImageView!
    @IBOutlet weak var likeControl: LikeControl!
    
    func configure(image: UIImage, likeCount: Int) {
        friendsPhotoImage.image = image
        likeControl.setLike(count: likeCount)
        likeControl.addTarget(self, action: #selector(likeTapped), for: .valueChanged)
    }
    
    @objc func likeTapped() {
        likeControlTapped?(likeControl.likeCounter)
    }
}
