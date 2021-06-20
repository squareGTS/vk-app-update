//
//  GroupController.swift
//  VK app
//
//  Created by Maxim Bekmetov on 11.04.2021.
//

import UIKit

class AllGroupsController: UITableViewController {
    
    var group = Group.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return group.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupCell else { return UITableViewCell() }
        
        let curentGroup = group[indexPath.row]
        if let avatar = curentGroup.avatar {
        cell.configure(image: avatar, name: curentGroup.name)
        }
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
        cell.transform = scale
        cell.alpha = 0.5
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0, usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0,
            options: [.curveEaseInOut],
            animations: {
                cell.transform = .identity
                cell.alpha = 1
            })
    }
}
