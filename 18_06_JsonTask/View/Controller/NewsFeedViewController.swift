//
//  NewsFeedViewController.swift
//  18_06_JsonTask
//
//  Created by Varshith Chilamkurthi on 19/06/24.
//

import UIKit

class NewsFeedViewController: UIViewController {

    @IBOutlet var newsFeedTableView: UITableView!
    
    var newsFeedViewModelObj = NewsFeedViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsFeedTableView.dataSource = self
        newsFeedTableView.delegate = self
        fetchData()
    }
}
// MARK: - Table view set up
extension NewsFeedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsFeedViewModelObj.article?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedTableViewCell") as! NewsFeedTableViewCell
        if let setter = newsFeedViewModelObj.article?[indexPath.row] {
            cell.setData(setter: setter)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let acvc = sb.instantiateViewController(withIdentifier: "ArticleContentViewController") as! ArticleContentViewController
        acvc.articles = newsFeedViewModelObj.article?[indexPath.row]
        navigationController?.pushViewController(acvc, animated: true)
        newsFeedTableView.deselectRow(at: indexPath, animated: true)
    }
}
// MARK: - Api call
extension NewsFeedViewController {
    func fetchData() {
        newsFeedViewModelObj.fetchData(url: "https://gist.githubusercontent.com/congsun/600f3ad57298f9dbc23fedf6b2b25450/raw/73d7a8ed589652339ae3646d0a595298ce5e72c2/newsFeed.json") {
            DispatchQueue.main.async {
                self.newsFeedTableView.reloadData()
            }
        }
    }
}
