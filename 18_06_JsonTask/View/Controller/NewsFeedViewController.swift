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
        Task {
            await fetchData()
        }
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
            Task {
                do {
                    try await cell.setData(setter: setter)
                } catch {
                    print("failed setting the data")
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let acvc = sb.instantiateViewController(withIdentifier: "ArticleContentViewController") as! ArticleContentViewController
        navigationController?.pushViewController(acvc, animated: true)
        newsFeedTableView.deselectRow(at: indexPath, animated: true)
    }
}
// MARK: - Api call
extension NewsFeedViewController {
    func fetchData() async {
        do {
            try await newsFeedViewModelObj.fetchData(url: "https://gist.githubusercontent.com/congsun/600f3ad57298f9dbc23fedf6b2b25450/raw/73d7a8ed589652339ae3646d0a595298ce5e72c2/newsFeed.json")
            newsFeedTableView.reloadData()
        } catch {
            print("error fetching data")
        }
    }
}
