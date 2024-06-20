//
//  VideoModel.swift
//  18_06_JsonTask
//
//  Created by Varshith Chilamkurthi on 19/06/24.
//

import Foundation

struct Video: Codable {
    let title: String
    let created_at: String
    let transcodings: [Transcodings]
}

struct Transcodings: Codable {
    let id: String
    let title: String
    let height: Int
}
