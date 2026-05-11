//
//  ActivityCard.swift
//  Renturn-QuickDiscovering
//
//  Created by Jihye Park on 11/5/2026.
//

import SwiftUI

struct ActivityItem: Identifiable {
    let id = UUID()
    let name: String
    let text: String
    let imageName: String
}

struct ActivityCard: View {
    let activity: ActivityItem

    var body: some View {
        HStack(spacing: 10) {
            Circle()
                .fill(Color.blue.opacity(0.2))
                .frame(width: 36, height: 36)
                .overlay(
                    Image(systemName: "person.fill")
                        .foregroundColor(.blue)
                )

            Text(activity.name)
                .font(.system(size: 13, weight: .bold))
            +
            Text(" \(activity.text) ")
                .font(.system(size: 13))
            +
            Text("1h")
                .font(.system(size: 13))
                .foregroundColor(.gray)

            Spacer()

            RoundedRectangle(cornerRadius: 8)
                .fill(Color(.systemGray5))
                .frame(width: 42, height: 42)
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.08), radius: 5, y: 2)
    }
}
