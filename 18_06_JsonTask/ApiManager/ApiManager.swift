//
//  ApiManager.swift
//  18_06_JsonTask
//
//  Created by Varshith Chilamkurthi on 18/06/24.
//

import Foundation

class ApiManager {
    static let sharedInstance = ApiManager()
    private init() {}
    
    func getApiData(url: String, completion: @escaping (Data?) -> ()) {
        let url = URL(string: url)
        guard let url = url else { return }
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if error != nil {
                print("error")
                return
            }
            completion(data)
        }.resume()
    }
}
