//
//  Q2ViewController.swift
//  18_06_JsonTask
//
//  Created by Varshith Chilamkurthi on 18/06/24.
//

import UIKit

class Q2ViewController: UIViewController {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var birthYearLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var createdLabel: UILabel!
    
    var userViewModelObj = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "User Data"
        fetchData()
    }
}
// MARK: - Api call and setting data
extension Q2ViewController {
    func fetchData() {
        userViewModelObj.fetchData(url: "https://swapi.py4e.com/api/people/1") {
            DispatchQueue.main.async {
                if let obj = self.userViewModelObj.user {
                    self.nameLabel.text = "Name: \(obj.name)"
                    self.heightLabel.text = "Height: \(obj.height)"
                    self.birthYearLabel.text = "Birth Year: \(obj.birth_year)"
                    self.genderLabel.text = "Gender: \(obj.gender)"
                    self.createdLabel.text = "Created at: \(obj.created)"
                }
            }
        }
    }
}
