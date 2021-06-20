//
//  GroupsController.swift
//  VK app
//
//  Created by Maxim Bekmetov on 12.04.2021.
//

import UIKit

class GroupsController: UITableViewController {
    
    var group = [Group]()
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        guard segue.identifier == "addGroup",
              let allGroupsController = segue.source as? AllGroupsController,
              let indexPath = allGroupsController.tableView.indexPathForSelectedRow
        else { return }
        let groups = allGroupsController.group[indexPath.row]
        if !group.contains(groups) {
            group.append(groups)
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Table view data source
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell") as? GroupCell else { return UITableViewCell() }
        
        let currentGroup = group[indexPath.row]
        
        if let avatar = currentGroup.avatar {
            cell.configure(
                image: avatar,
                name: currentGroup.name)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            group.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
