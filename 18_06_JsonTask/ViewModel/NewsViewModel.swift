//
//  NewsViewModel.swift
//  18_06_JsonTask
//
//  Created by Varshith Chilamkurthi on 19/06/24.
//

import Foundation

class NewsFeedViewModel {
    var article: [Article]?
    
    func fetchData(url: String) async throws -> () {
        if let data = try await ApiManager.sharedInstance.getApiData(url: url) {
            article = decodeData(data: data)
        }
    }
    
    func decodeData(data: Data) -> ([Article]?) {
            do {
                let decodedData = try JSONDecoder().decode(Model.self, from: data)
                return decodedData.articles
            } catch {
                print("not decoded")
                return nil
            }
    }
}
