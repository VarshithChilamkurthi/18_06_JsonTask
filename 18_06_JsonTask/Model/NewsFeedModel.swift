//
//  NewsFeedModel.swift
//  18_06_JsonTask
//
//  Created by Varshith Chilamkurthi on 19/06/24.
//

import Foundation

struct Model: Codable {
    let articles: [Article]?
}

struct Article: Codable {
    let title: String?
    let author: String?
    let source: Source?
    let publishedAt: String?
    let urlToImage: String?
    let content: String?
}

struct Source: Codable {
    let name: String?
}
