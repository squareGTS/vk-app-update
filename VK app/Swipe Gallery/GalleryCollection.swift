//
//  GalleryCollection.swift
//  VK app
//
//  Created by Maxim Bekmetov on 01.06.2021.
//

import UIKit

protocol PhotoToFriendDelegate: AnyObject {
    func showPresenter(photos: [Photo], selectedPhoto: Int)
}

class GalleryCollection: UICollectionView {
    
    var photos = [Photo]()
    
    weak var presentDelegate: PhotoToFriendDelegate?

    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        delegate = self
        dataSource = self

        
        register(FriendsGaleryCell.self, forCellWithReuseIdentifier: FriendsGaleryCell.reuseID)
        
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = true
        
        layout.minimumLineSpacing = Constants.galleryMinimumLineSpacing
        contentInset = UIEdgeInsets(top: Constants.topDistanceToView, left: Constants.leftDistanceToView, bottom: 0, right: Constants.rightDistanceToView)
    
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(photos: [Photo]) {
        self.photos = photos
    }

}
extension GalleryCollection: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presentDelegate?.showPresenter(photos: photos, selectedPhoto: indexPath.item)
    }
}
extension GalleryCollection: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: FriendsGaleryCell.reuseID, for: indexPath) as! FriendsGaleryCell
        cell.imageView.image = photos[indexPath.item].photos
        return cell
    }
}
extension GalleryCollection: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: Constants.galleryItemWidth, height: Constants.galleryItemWidth)
    }
}
struct Constants {
    static let leftDistanceToView: CGFloat = 20
    static let rightDistanceToView: CGFloat = 20
    static let topDistanceToView: CGFloat = 20
    static let galleryMinimumLineSpacing: CGFloat = 10
    static let galleryItemWidth = (UIScreen.main.bounds.width - Constants.leftDistanceToView - Constants.rightDistanceToView - Constants.galleryMinimumLineSpacing) / 2
}
