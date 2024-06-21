//
//  ViewController.swift
//  18_06_JsonTask
//
//  Created by Varshith Chilamkurthi on 18/06/24.
//

import UIKit

class Q1ViewController: UIViewController {

    @IBOutlet var usersListTableView: UITableView!
    
    var usersViewModelObj = UsersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usersListTableView.dataSource = self
        usersListTableView.delegate = self
        self.title = "Users List"
        Task {
            await fetchData()
        }
    }
}
// MARK: - TableView setup
extension Q1ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersViewModelObj.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        let setter = usersViewModelObj.users[indexPath.row]
        cell.textLabel?.text = setter.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let udvc = sb.instantiateViewController(withIdentifier: "UsersDataViewController") as! UsersDataViewController
        let setter = usersViewModelObj.users[indexPath.row]
        udvc.userObj = setter
        navigationController?.pushViewController(udvc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
// MARK: - Network call
extension Q1ViewController {
    func fetchData() async {
        do {
            try await usersViewModelObj.fetchData(url: "https://jsonplaceholder.typicode.com/users")
            usersListTableView.reloadData()
        } catch {
            print("error fetching data")
        }
    }
}

