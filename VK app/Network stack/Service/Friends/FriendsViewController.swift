//
//  FriendsViewController.swift
//  VK app
//
//  Created by Maxim Bekmetov on 27.06.2021.
//

import UIKit
//import Alamofire

class FriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var friends = [User]()
    let apiService = APIService()
    
    var friend: [UserModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        apiService.getFriendsQuicktype { users in
//            self.friends = users
//            self.tableView.reloadData()
//        }
        
         
        apiService.getFriendsQuicktype{ [weak self]  users in
        print(users)
        
            
            //will finish work and after that close controller
            guard let self = self else { return }
            self.friend = users
            self.tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
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
        return cell
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
