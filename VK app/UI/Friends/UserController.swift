//
//  FriendsController.swift
//  VK app
//
//  Created by Maxim Bekmetov on 11.04.2021.
//

import UIKit

class UserViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var latersControl: LettersControl!
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else {
            return false
        }
        return text.isEmpty
    }
    
    private var friends = [Character: [Friend]]()
    private var friend = [Friend]()
    var firstLetters: [Character] {
        get {
            friends.keys.sorted()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        friends = Friend.getSortedUsers(searchText: nil)
        
        tableView.register(UINib(nibName: "FriendCell", bundle: nil), forCellReuseIdentifier: FriendCellXib.reuseIdentifier)
        
        setSearchController()
        setLettersControl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //    if segue.identifier == "FriendsToPhotoSegue" {
    //        if let indexPath = self.tableView.indexPathForSelectedRow {
    //            let controller = segue.destination as! PhotoToFriendViewController
    //            let users = friends[firstLetters[indexPath.section]]
    //            let user = users?[indexPath.row]
    //            controller.photosToFriend = user?.image ?? [String]()
    //            controller.title = user?.name
    //        }
    //    }
    //}
    
    private func setSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Поиск"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    private func setLettersControl() {
        
        view.addSubview(latersControl)
        
        latersControl.translatesAutoresizingMaskIntoConstraints = false
        latersControl.arrChar = friends.keys.sorted()
        latersControl.backgroundColor = .clear
        latersControl.addTarget(self, action: #selector(scrollToSelectedLetter), for: [.touchUpInside])
        
        NSLayoutConstraint.activate([
            latersControl.heightAnchor.constraint(equalToConstant: CGFloat(15 * latersControl.arrChar.count)),
            latersControl.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            latersControl.widthAnchor.constraint(equalToConstant: 20),
            latersControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    @objc func scrollToSelectedLetter(){
        for indexSextion in 0..<firstLetters.count{
            if latersControl.selectedLetter == firstLetters[indexSextion]{
                tableView.scrollToRow(at: IndexPath(row: 0, section: indexSextion), at: .top, animated: true)
                break
            }
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // Если была нажата кнопка «Удалить»
        if editingStyle == .delete {
            // Удаляем друга из массива
            friend.remove(at: indexPath.row)
            // И удаляем строку из таблицы
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

//MARK:- UISearchResultsUpdating
extension UserViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterFriendForSearchText(searchController.searchBar.text!)
    }
    
    private func filterFriendForSearchText(_ searchText: String){
        friends = Friend.getSortedUsers(searchText: searchText)
        if searchText == "" {
            latersControl.isHidden = false
        } else {
            latersControl.isHidden = true
        }
        tableView.reloadData()
    }
}

//MARK:- UITableViewDelegate
extension UserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "PhotoToFriendVC") as? PhotoToFriendVC
        
        guard let destinationController = controller else { return }
        
        let key = firstLetters[indexPath.section]
        let friendsForKey = friends[key]
            
        if let friend = friendsForKey?[indexPath.row] {
            destinationController.photosToFriends = friend.photos
            navigationController?.pushViewController(destinationController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
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

//MARK:- UITableViewDataSource
extension UserViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if searchBarIsEmpty {
            return friends.keys.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if searchBarIsEmpty {
            let header = HeaderSectionTableView()
            header.titleLabel.text = String(firstLetters[section].uppercased())
            return header
        } else {
            return HeaderSectionTableView()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard !firstLetters.isEmpty else {return 0}
        let key = firstLetters[section]
        return friends[key]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendCellXib.reuseIdentifier, for: indexPath) as! FriendCellXib
        let key = firstLetters[indexPath.section]
        let friendsForKey = friends[key]
        
        if let friend = friendsForKey?[indexPath.row] {
            cell.configure(friend)
        }
        return cell
    }
}
