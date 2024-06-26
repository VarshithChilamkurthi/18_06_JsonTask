//
//  MealsContentViewController.swift
//  18_06_JsonTask
//
//  Created by Varshith Chilamkurthi on 21/06/24.
//

import UIKit

class MealsContentViewController: UIViewController {

    @IBOutlet var mealPicImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var areaLabel: UILabel!
    @IBOutlet var instructionsScrollView: UIScrollView!
    @IBOutlet var instructionsLabel: UILabel!
    
    var meals: Meals?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setData()
    }
}
// MARK: - Setting UI
extension MealsContentViewController {
    @objc func backButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func setUI() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: .none)
    }
}
extension MealsContentViewController {
    func setData() {
        titleLabel.text = meals?.strMeal
        categoryLabel.text = meals?.strCategory
        areaLabel.text = meals?.strArea
        //setting up instructions section
        instructionsLabel.text = meals?.strInstructions
        instructionsLabel.lineBreakMode = .byWordWrapping
        instructionsLabel.sizeToFit()
        //setting up scrollview: width: scrollview frame width, height: label frame height
        instructionsScrollView.contentSize = CGSize(width: instructionsScrollView.frame.width, height: instructionsLabel.frame.height)
        //decoding image data
        if let imageUrl = meals?.strMealThumb {
            ApiManager.sharedInstance.getApiData(url: imageUrl) { data in
                if let data = data {
                    DispatchQueue.main.async {
                        self.mealPicImageView.image = UIImage(data: data)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.mealPicImageView.image = UIImage(systemName: "photo")
                    }
                }
            }
        }
    }
}
