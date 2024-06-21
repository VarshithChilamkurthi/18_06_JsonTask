//
//  NewsFeedTableViewCell.swift
//  18_06_JsonTask
//
//  Created by Varshith Chilamkurthi on 19/06/24.
//

import UIKit

class NewsFeedTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var sourceLabel: UILabel!
    @IBOutlet var articleImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setData(setter: Article) async throws -> () {
        titleLabel.text = setter.title
        if let author = setter.author {
            authorLabel.text = author
        } else {
            authorLabel.text = "N/A"
        }
        if let name = setter.source?.name {
            sourceLabel.text = name
        }
        //converting image url to data with apimanager
        if let imageUrl = setter.urlToImage {
            let imageData = try await ApiManager.sharedInstance.getApiData(url: imageUrl)
            if let imageData = imageData {
                articleImageView.image = UIImage(data: imageData)
            }
        } else {
            articleImageView.image = UIImage(systemName: "photo")
        }
    }
}
