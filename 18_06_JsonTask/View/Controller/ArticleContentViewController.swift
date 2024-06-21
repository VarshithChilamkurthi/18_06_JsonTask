//
//  ArticleContentViewController.swift
//  18_06_JsonTask
//
//  Created by Varshith Chilamkurthi on 19/06/24.
//

import UIKit

class ArticleContentViewController: UIViewController {

    @IBOutlet var articleImageView: UIImageView!
    @IBOutlet var articleTitleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var contentLabel: UILabel!
    @IBOutlet var sourceLabel: UILabel!
    
    var articles: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        Task {
            await setData()
        }
    }
}
// MARK: - Setting UI
extension ArticleContentViewController {
    @objc func backButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func setUI() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: .none)
    }
}
// MARK: - Setting Data
extension ArticleContentViewController {
    func setData() async {
        articleTitleLabel.text = articles?.title
        authorLabel.text = articles?.author
        dateLabel.text = articles?.publishedAt
        contentLabel.text = articles?.content
        sourceLabel.text = articles?.source?.name
        //decoding image data
        if let imageUrl = articles?.urlToImage {
            do {
                let imageData = try await ApiManager.sharedInstance.getApiData(url: imageUrl)
                if let imageData = imageData {
                    articleImageView.image = UIImage(data: imageData)
                }
            } catch {
                print("could not decode image data")
            }
        } else {
            articleImageView.image = UIImage(systemName: "photo")
        }
    }
}
