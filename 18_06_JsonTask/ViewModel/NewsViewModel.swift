//
//  NewsViewModel.swift
//  18_06_JsonTask
//
//  Created by Varshith Chilamkurthi on 19/06/24.
//

import Foundation

class NewsFeedViewModel {
    var article: [Article]?
    
    func fetchData(url: String, completion: @escaping () -> ()) {
        ApiManager.sharedInstance.getApiData(url: url) { data in
            if let data = data {
                print(data)
                self.article = self.decodeData(data: data)
                completion()
            }
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
    
//    func decodeImageData(url: String) -> () { //need to return data?
//        ApiManager.sharedInstance.getApiData(url: url) { data in
//            print(data)
//        }
//    }
}
