//
//  PhotoViewController.swift
//  VK app
//
//  Created by Maxim Bekmetov on 29.06.2021.
//

import UIKit

class PhotoViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!

    var photos = [Photoo]()
    let apiService = APIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        apiService.getPhotosQuicktype { photo in
//            self.photos = photo
//            self.collectionView.reloadData()
//        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCollectionViewCell
        
        if let url = URL(string: photos[indexPath.row].photoIds ?? String()) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async { /// execute on main thread
                    cell.photo.image = UIImage(data: data)
                }
            }
            task.resume()
        }
        return cell
    }
}
