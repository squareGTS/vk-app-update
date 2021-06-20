//
//  NewsView.swift
//  VK app
//
//  Created by Maxim Bekmetov on 18.05.2021.
//

import UIKit

class NewsTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var news = News.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: NewsCellXib.reusedId)
        
        // tableView.delegate = self
        tableView.dataSource = self
    }
}

//MARK:- UITableViewDelegate
extension NewsTableViewController: UITableViewDelegate {
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    //
    //        let controller = storyboard.instantiateViewController(withIdentifier: "") as?
    //    }
}


//MARK:- UITableViewDataSource
extension NewsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCellXib.reusedId, for: indexPath) as! NewsCellXib
        
        let news = news[indexPath.row]
        cell.configure(news)
        
        return cell
    }
}


