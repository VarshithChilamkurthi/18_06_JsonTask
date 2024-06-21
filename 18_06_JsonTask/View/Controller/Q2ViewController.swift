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
        Task {
            await fetchData()
        }
    }
}
// MARK: - Api call and setting data
extension Q2ViewController {
    func fetchData() async {
        do {
            try await userViewModelObj.fetchData(url: "https://swapi.py4e.com/api/people/1")
            if let obj = userViewModelObj.user {
                nameLabel.text = "Name: \(obj.name)"
                heightLabel.text = "Height: \(obj.height)"
                birthYearLabel.text = "Birth Year: \(obj.birth_year)"
                genderLabel.text = "Gender: \(obj.gender)"
                createdLabel.text = "Created at: \(obj.created)"
            }
        } catch {
            print("error fetching data")
        }
    }
}
