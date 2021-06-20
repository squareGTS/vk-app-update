//
//  PhotoController.swift
//  VK app
//
//  Created by Maxim Bekmetov on 11.04.2021.
//

import UIKit

class FriendsPhotoCollection: UICollectionViewController {
    
    let spacing: CGFloat = 20
    let itemsInRow = 1
    
    var userImages: [Photo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userImages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as? FriendPhotoCell
        else { return UICollectionViewCell() }
        // cell.friendsPhotoImage.image = userImages[indexPath.row]
        
        cell.configure(image: userImages[indexPath.row].photos ?? UIImage(), likeCount: indexPath.item * 10)
        cell.likeControlTapped = {[weak self] likeCount in
            print(likeCount)
            self?.userImages[indexPath.item].likeCount = likeCount
        }
        return cell
    }
}

//MARK:- UICollectionViewDelegateFlowLayout
extension FriendsPhotoCollection: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //width gap
        let widthSpacing: CGFloat = spacing * CGFloat(itemsInRow + 1)
        
        //width all items in row collection
        let widthItemsInRow = collectionView.frame.width - widthSpacing
        
        //width 1 item
        let widthItem = widthItemsInRow / CGFloat(itemsInRow)
        
        return CGSize(width: widthItem, height: widthItem)
    }
}


