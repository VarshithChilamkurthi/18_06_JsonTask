//
//  MealsViewModel.swift
//  18_06_JsonTask
//
//  Created by Varshith Chilamkurthi on 21/06/24.
//

import Foundation

class MealsViewModel {
    var meals: [Meals]?
    
    func fetchData(url: String) async throws -> () {
        if let data = try await ApiManager.sharedInstance.getApiData(url: url) {
            meals = decodeData(data: data)
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
