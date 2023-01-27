//
//  Model.swift
//  FakestoreProject
//
//  Created by Unsal Oner on 24.01.2023.
//


import UIKit

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let image: String
    let rating: Rating
}


// MARK: - Rating
struct Rating: Codable {
    let rate: Double
    let count: Int
}

