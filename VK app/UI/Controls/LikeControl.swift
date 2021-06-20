//
//  LikeControl.swift
//  VK app
//
//  Created by Maxim Bekmetov on 16.05.2021.
//

import UIKit

class LikeControl: UIControl {
    
    var imageView = UIImageView()
    var likeCountLabel = UILabel()
    
    var likeCounter = 0
    var isLike: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = bounds
    }
    
    func setLike(count: Int) {
        likeCounter = count
        setLikeCounterLabel()
    }
    
    func setView() {
        self.addSubview(imageView)
        self.addTarget(self, action: #selector(tapControl), for: .touchUpInside)
        
        imageView.tintColor = #colorLiteral(red: 0.937254902, green: 0.2345213085, blue: 0, alpha: 1)
        imageView.image = UIImage(systemName: "heart")
        
        setLikeCounterLabel()
    }
    
    func setLikeCounterLabel() {
        addSubview(likeCountLabel)
        let likeString: String?
        
        switch likeCounter {
        case 0..<1000:
            likeString = String(self.likeCounter)
        case 1000..<1_000_000:
            likeString = String(self.likeCounter / 1000) + "K"
        default:
            likeString = "_"
        }
        UIView.transition(with: likeCountLabel, duration: 0.3, options: .transitionFlipFromTop, animations: {[unowned self] in self.likeCountLabel.text = String(likeString!)
            
        })
        
        likeCountLabel.textColor = #colorLiteral(red: 0.937254902, green: 0.2345213085, blue: 0, alpha: 1)
        likeCountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        likeCountLabel.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -8).isActive = true
        likeCountLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
    }
    
    @objc func tapControl() {
        isLike.toggle()
        if isLike {
            imageView.image = UIImage(systemName: "heart.fill")
            likeCounter += 1
            setLikeCounterLabel()
        } else {
            imageView.image = UIImage(systemName: "heart")
            likeCounter -= 1
            setLikeCounterLabel()
        }
        sendActions(for: .valueChanged )
    }
}
