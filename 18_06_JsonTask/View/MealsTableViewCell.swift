//
//  MealsTableViewCell.swift
//  18_06_JsonTask
//
//  Created by Varshith Chilamkurthi on 21/06/24.
//

import UIKit

class MealsTableViewCell: UITableViewCell {

    @IBOutlet var mealsImageView: UIImageView!
    @IBOutlet var mealsTitleLabel: UILabel!
    @IBOutlet var mealsInstructionsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(setter: Meals) async {
        mealsTitleLabel.text = setter.strMeal
        mealsInstructionsLabel.text = setter.strInstructions
        //decoding image data
        if let imageUrl = setter.strMealThumb {
            do {
                let imageData = try await ApiManager.sharedInstance.getApiData(url: imageUrl)
                if let imageData = imageData {
                    mealsImageView.image = UIImage(data: imageData)
                }
            } catch {
                print("error getting image data")
            }
        } else {
            mealsImageView.image = UIImage(systemName: "photo")
        }
    }
}
