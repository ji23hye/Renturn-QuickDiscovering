//
//  MessageCard.swift
//  Renturn-QuickDiscovering
//
//  Created by Jihye Park on 11/5/2026.
//

import SwiftUI

struct MessagePreview: Identifiable {
    let id = UUID()
    let name: String
    let text: String
    let imageName: String
}

struct MessageCard: View {
    let message: MessagePreview

    var body: some View {
        HStack(spacing: 14) {
            Circle()
                .fill(Color.blue.opacity(0.2))
                .frame(width: 52, height: 52)
                .overlay(
                    Image(systemName: "person.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.blue)
                )

            VStack(alignment: .leading, spacing: 4) {
                Text(message.name)
                    .font(.system(size: 15, weight: .bold))

                Text(message.text)
                    .font(.system(size: 13))
                    .foregroundColor(.black)
                    .lineLimit(2)
            }

            Spacer()
        }
        .padding(14)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.08), radius: 5, y: 2)
    }
}
