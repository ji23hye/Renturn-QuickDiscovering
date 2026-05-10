//
//  CategoryCard.swift
//  Renturn-QuickDiscovering
//
//  Created by Jihye Park on 10/5/2026.
//

import SwiftUI

struct CategoryCard: View {
    let title: String
    let icon: String

    var body: some View {
        VStack(spacing: 14) {
            Image(systemName: icon)
                .font(.system(size: 42))
                .foregroundColor(Color(red: 0.08, green: 0.10, blue: 0.20))

            Text(title)
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 150)
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}

#Preview {
    CategoryCard(title: "Dresses", icon: "tshirt")
}
