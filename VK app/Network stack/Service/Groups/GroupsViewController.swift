//
//  GroupsViewController.swift
//  VK app
//
//  Created by Maxim Bekmetov on 29.06.2021.
//

import UIKit

class GroupsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var groups = [Groupp]()
    let apiService = APIService()

    override func viewDidLoad() {
        super.viewDidLoad()

        apiService.getGroupsQuicktype { users in
            self.groups = users
            self.tableView.reloadData()
        }

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell") as! GroupsTableViewCell
        
        if let url = URL(string: groups[indexPath.row].photo100 ?? String()) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }

                DispatchQueue.main.async { /// execute on main thread
                    cell.groupPhoto.image = UIImage(data: data)
                }
            }
            task.resume()
        }

        cell.nameOfGroup.text = groups[indexPath.row].name
        
        return cell
    }
}
