//
//  ComentControl.swift
//  VK app
//
//  Created by Maxim Bekmetov on 19.05.2021.
//

import UIKit

class ComentControl: UIControl {
    
    var imageView = UIImageView()
    var comentCountLabel = UILabel()
    
    var comentCounter = 0
    
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
    
    func setComent(count: Int) {
        comentCounter = count
        setComentCounterLabel()
    }
    
    func setView() {
        self.addSubview(imageView)
        self.addTarget(self, action: #selector(tapControl), for: .touchUpInside)
        
        imageView.tintColor = #colorLiteral(red: 0.342677474, green: 0.5144165754, blue: 0.7103293538, alpha: 1)
        imageView.image = UIImage(systemName: "message.fill")
        
        setComentCounterLabel()
    }
    
    func setComentCounterLabel() {
        addSubview(comentCountLabel)
//        let comentString: String?
//
//        switch comentCounter {
//        case 0..<1000:
//            comentString = String(self.comentCounter)
//        case 1000..<1_000_000:
//            comentString = String(self.comentCounter / 1000) + "K"
//        default:
//            comentString = "_"
//        }
//
//        UIView.transition(with: comentCountLabel, duration: 0.3, options: .transitionFlipFromTop, animations: {[unowned self] in self.comentCountLabel.text = String(comentString!)
//        })
        
        comentCountLabel.textColor = #colorLiteral(red: 0.342677474, green: 0.5144165754, blue: 0.7103293538, alpha: 1)
        comentCountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        comentCountLabel.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -8).isActive = true
        comentCountLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
    }
    
    @objc func tapControl() {
           // imageView.image = UIImage(systemName: "message.fill")
            setComentCounterLabel()
        
        sendActions(for: .valueChanged )
    }
}
