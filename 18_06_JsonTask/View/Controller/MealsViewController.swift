//
//  MealsViewController.swift
//  18_06_JsonTask
//
//  Created by Varshith Chilamkurthi on 21/06/24.
//

import UIKit

class MealsViewController: UIViewController {

    @IBOutlet var mealsTableView: UITableView!
    
    var mealsViewModelObj = MealsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mealsTableView.dataSource = self
        mealsTableView.delegate = self
        Task {
            await fetchData()
        }
    }
}

extension MealsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealsViewModelObj.meals?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealsTableViewCell", for: indexPath) as! MealsTableViewCell
        if let setter = mealsViewModelObj.meals?[indexPath.row] {
            Task {
                await cell.setData(setter: setter)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mcvc = sb.instantiateViewController(withIdentifier: "MealsContentViewController") as! MealsContentViewController
        mcvc.meals = mealsViewModelObj.meals?[indexPath.row]
        navigationController?.pushViewController(mcvc, animated: true)
        mealsTableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MealsViewController {
    func fetchData() async {
        do {
            try await mealsViewModelObj.fetchData(url: "https://www.themealdb.com/api/json/v1/1/search.php?f=s")
            mealsTableView.reloadData()
        } catch {
            print("error fetching data")
        }
    }
}
