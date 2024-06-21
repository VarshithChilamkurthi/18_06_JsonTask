//
//  VideoViewModel.swift
//  18_06_JsonTask
//
//  Created by Varshith Chilamkurthi on 19/06/24.
//

import Foundation

class VideoViewModel {
    var video: [Video]?
    
    func fetchData(url: String) async throws -> () {
        if let data = try await ApiManager.sharedInstance.getApiData(url: url) {
            video = decodeData(data: data)
        }
    }
    
    func decodeData(data: Data) -> ([Video]?) {
        do {
            let decodedData = try JSONDecoder().decode([Video].self, from: data)
            return decodedData
        } catch {
            print("not decoded")
            return nil
        }
    }
}
