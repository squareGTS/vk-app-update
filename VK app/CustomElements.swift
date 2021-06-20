//
//  CustomElements.swift
//  VK app
//
//  Created by Maxim Bekmetov on 14.04.2021.
//

import UIKit

import UIKit

class AvatarImage: UIImageView {
    @IBInspectable var borderColor: UIColor = .black
    @IBInspectable var borderWidth: CGFloat = 1
    
    override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
}

class AvatarBackShadow: UIView {
    @IBInspectable var shadowColor: UIColor = .black
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: -3)
    @IBInspectable var shadowOpacity: Float = 0.8
    @IBInspectable var shadowRadius: CGFloat = 5
    
    override func awakeFromNib() {
       // self.backgroundColor = .clear
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
        self.layer.cornerRadius = self.frame.height / 2
    }
}
