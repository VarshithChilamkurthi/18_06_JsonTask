//
//  MealsViewModel.swift
//  18_06_JsonTask
//
//  Created by Varshith Chilamkurthi on 21/06/24.
//

import Foundation

class MealsViewModel {
    var meals: [Meals]?
    
    func fetchData(url: String, completion: @escaping () -> ()) {
        ApiManager.sharedInstance.getApiData(url: url) { data in
            if let data = data {
                print(data)
                self.meals = self.decodeData(data: data)
                completion()
            }
        }
    }
    
    func decodeData(data: Data) -> ([Meals]?) {
            do {
                let decodedData = try JSONDecoder().decode(MealsModel.self, from: data)
                return decodedData.meals
            } catch {
                print("not decoded")
                return nil
            }
    }
}
