//
//  UserViewModel.swift
//  18_06_JsonTask
//
//  Created by Varshith Chilamkurthi on 19/06/24.
//

import Foundation

class UserViewModel {
    var user: User?

    func fetchData(url: String, completion: @escaping () -> ()) {
        ApiManager.sharedInstance.getApiData(url: url) { data in
            if let data = data {
                self.user = self.decodeData(data: data)
                completion()
            }
        }
    }
    
    func decodeData(data: Data) -> (User?) {
        do {
            let decodedData = try JSONDecoder().decode(User.self, from: data)
            return decodedData
        } catch {
            print("not decoded")
            return nil
        }
    }
}
