//
//  ProductCard.swift
//  Renturn-QuickDiscovering
//
//  Created by Jihye Park on 10/5/2026.
//

import SwiftUI

struct ProductCard: View {
    let product: Product

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Image(product.imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 170)
                .frame(maxWidth: .infinity)
                .clipped()
                .background(Color(.systemGray6))

            Text(product.name)
                .font(.system(size: 14, weight: .semibold))
                .lineLimit(1)

            Text("$\(product.pricePerDay)/day")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.blue)
        }
    }
}

#Preview {
    ProductCard(product: sampleDressProducts[0])
}
