//
//  UserViewModel.swift
//  18_06_JsonTask
//
//  Created by Varshith Chilamkurthi on 19/06/24.
//

import Foundation

class UserViewModel {
    var user: User?

    func fetchData(url: String) async throws -> () {
        if let data = try await ApiManager.sharedInstance.getApiData(url: url) {
            user = decodeData(data: data)
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
