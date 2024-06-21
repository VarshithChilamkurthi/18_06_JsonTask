//
//  MealsModel.swift
//  18_06_JsonTask
//
//  Created by Varshith Chilamkurthi on 21/06/24.
//

import Foundation

struct MealsModel: Codable {
    let meals: [Meals]?
}

struct Meals: Codable {
    let strMeal: String?
    let strInstructions: String?
    let strMealThumb: String?
    let strCategory: String?
    let strArea: String?
}
