//
//  UsersDataViewController.swift
//  18_06_JsonTask
//
//  Created by Varshith Chilamkurthi on 18/06/24.
//

import UIKit

class UsersDataViewController: UIViewController {

    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var websiteLabel: UILabel!
    
    var userObj: Users?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "User Data"
        setUp()
    }
    
    func setUp() {
        if let obj = userObj {
            usernameLabel.text = "Username: \(obj.username)"
            emailLabel.text = "Email: \(obj.email)"
            phoneLabel.text = "Phone: \(obj.phone)"
            websiteLabel.text = "Website: \(obj.website)"
        }
    }
}
