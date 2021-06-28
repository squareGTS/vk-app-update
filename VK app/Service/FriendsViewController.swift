//
//  FriendsViewController.swift
//  VK app
//
//  Created by Maxim Bekmetov on 27.06.2021.
//

import UIKit
//import Alamofire

class FriendsViewController: UIViewController {
    
    
    
    var friends = [User]()
    
    @IBOutlet weak var tableView: UITableView!
    
    let apiService = APIService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        apiService.getFriendsQuicktype { users in
            
            print(users)
            
            self.friends = users
        }
        
    }
    
    
    //        apiService.getGroupsQuicktype { groups in
    //
    //            print(groups)
    //        }
    
    //        apiService.getPhotosQuicktype { photos in
    //
    //                    print(photos)
    //                }
    
    
    
    //        apiService.getFriends { users in
    //            print("getFriends")
    //        }
    
    //        apiService.getGroupsManual { users in
    //            print("getGroups")
    //        }
}

extension FriendsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension FriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell") as! FriendsTableViewCell
        if let url = URL(string: friends[indexPath.row].photo100 ?? String()) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async { /// execute on main thread
                    cell.photoNew.image = UIImage(data: data)
                }
            }
            task.resume()
        }
        
        
        cell.firstNameNew.text = friends[indexPath.row].firstName
        cell.lastNameNew.text = friends[indexPath.row].lastName
        print(friends[indexPath.row].firstName)
        return cell
    }
    
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "friendCell") as! FriendsTableViewCell
    //        if let url = URL(string: friends[indexPath.row].photo100 ?? String()) {
    //            let task = URLSession.shared.dataTask(with: url) { data, response, error in
    //                guard let data = data, error == nil else { return }
    //
    //                DispatchQueue.main.async { /// execute on main thread
    //                    cell.photoNew.image = UIImage(data: data)
    //                }
    //            }
    //            task.resume()
    //        }
    //
    //
    //        cell.firstNameNew.text = friends[indexPath.row].firstName
    //        cell.lastNameNew.text = friends[indexPath.row].lastName
    //        print(friends[indexPath.row].firstName)
    //        return cell
    //    }
}
