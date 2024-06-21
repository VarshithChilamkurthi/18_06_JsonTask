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
    
    func getApiData(url: String) async throws -> Data? {
        let url = URL(string: url)
        guard let url = url else { return nil }
        let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))
        return data
    }
}
