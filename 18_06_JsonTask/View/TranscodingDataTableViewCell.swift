//
//  TranscodingDataTableViewCell.swift
//  18_06_JsonTask
//
//  Created by Varshith Chilamkurthi on 19/06/24.
//

import UIKit

class TranscodingDataTableViewCell: UITableViewCell {

    @IBOutlet var idLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setData(setter: Transcodings) {
        idLabel.text = "Id: \(setter.id)"
        titleLabel.text = "Title: \(setter.title)"
        heightLabel.text = "Height: \(String(setter.height))"
    }

}
