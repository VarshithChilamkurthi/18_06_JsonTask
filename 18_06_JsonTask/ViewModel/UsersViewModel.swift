//
//  UsersViewModel.swift
//  18_06_JsonTask
//
//  Created by Varshith Chilamkurthi on 18/06/24.
//

import Foundation

class UsersViewModel {
    var users: [Users] = []
    
    func fetchData(url: String, completion: @escaping () -> ()) {
        ApiManager.sharedInstance.getApiData(url: url) { data in
            if let data = data {
                self.users = self.decodeData(data: data)
                completion()
            }
        }
    }
    
    func decodeData(data: Data) -> ([Users]) {
        do {
            let decodedData = try JSONDecoder().decode([Users].self, from: data)
            return decodedData
        } catch {
            print("not decoded")
            return []
        }
    }
}
