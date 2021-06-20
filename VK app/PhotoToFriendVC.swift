//
//  PhotoToFriendVC.swift
//  VK app
//
//  Created by Maxim Bekmetov on 01.06.2021.
//

import UIKit

class PhotoToFriendVC: UIViewController, PhotoToFriendDelegate {
    
    var photosToFriends = [Photo]()
    private var galery = GalleryCollection()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        galery.presentDelegate = self
        view.addSubview(galery)
    
        galery.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        galery.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        galery.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        galery.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        galery.set(photos: photosToFriends)
        galery.reloadData()
    }
    
    func showPresenter(photos: [Photo], selectedPhoto: Int) {
        let presentVC = PresentGaleryVC()
        presentVC.photos = photos
        presentVC.selectedPhoto = selectedPhoto
        presentVC.modalPresentationStyle = .automatic
        presentVC.modalTransitionStyle = .coverVertical
        navigationController?.pushViewController(presentVC, animated: true)
    }
}
