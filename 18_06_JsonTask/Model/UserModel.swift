//
//  UserModel.swift
//  18_06_JsonTask
//
//  Created by Varshith Chilamkurthi on 19/06/24.
//

import Foundation
// MARK: - Q2 Model
struct User: Codable {
    let name: String
    let height: String
    let birth_year: String
    let gender: String
    let created: String
}
