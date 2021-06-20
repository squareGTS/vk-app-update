//
//  FriendCell.swift
//  VK app
//
//  Created by Maxim Bekmetov on 16.05.2021.
//

import UIKit

class FriendCellXib: UITableViewCell {
    
    @IBOutlet private weak var shadowView: UIView!
    @IBOutlet private weak var fullNameLabel: UILabel!
    @IBOutlet private weak var photoImageView: UIImageView!
    
    static let reuseIdentifier = "FriendCellXib"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // selectionStyle = .none
        
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(tapedOnName))
        photoImageView.addGestureRecognizer(tap)
        photoImageView.isUserInteractionEnabled = true
    }
    
    override func prepareForReuse() {
        fullNameLabel.text = ""
        photoImageView.image = UIImage(named: "PlaceHolderImage")
    }
    
    func configure(_ friend: Friend) {
        fullNameLabel.text = friend.fullName
        
        if let image = friend.avatar {
            photoImageView.image = image
        } else {
            photoImageView.image = UIImage(named: "PlaceHolderImage")
        }
    }
    
    @objc func tapedOnName(_ tapGestureRecognizer: UITapGestureRecognizer){
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 1,
                       options: [.autoreverse],
                       animations: {
                        let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
                        self.photoImageView.transform = scale
                        self.shadowView.transform = scale

        }) { _ in
            self.photoImageView.transform = .identity
            self.shadowView.transform = .identity
        }
    }
}
