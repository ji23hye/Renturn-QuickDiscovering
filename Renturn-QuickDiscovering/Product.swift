//
//  Product.swift
//  Renturn-QuickDiscovering
//
//  Created by Jihye Park on 10/5/2026.
//

import Foundation

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let brand: String
    let pricePerDay: Int
    let imageName: String
    let size: String
}

let sampleDressProducts = [
    Product(
        name: "Ganni Black Stretch Cotton Dress",
        brand: "@vogue_vintage",
        pricePerDay: 20,
        imageName: "dress_black",
        size: "S"
    ),
    Product(
        name: "Cos Navy Midi Dress",
        brand: "@minimal_closet",
        pricePerDay: 7,
        imageName: "dress_navy",
        size: "M"
    ),
    Product(
        name: "A.P.C Denim Dress",
        brand: "@denim_archive",
        pricePerDay: 18,
        imageName: "dress_denim",
        size: "S"
    ),
    Product(
        name: "Rebecca Vallance Ivory Gown",
        brand: "@formal_rentals",
        pricePerDay: 24,
        imageName: "dress_white",
        size: "S"
    )
]
