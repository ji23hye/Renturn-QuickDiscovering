//
//  RecentActivityView.swift
//  Renturn-QuickDiscovering
//
//  Created by Jihye Park on 11/5/2026.
//

import SwiftUI

struct RecentActivityView: View {
    let activities: [ActivityItem]
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 0) {
            topBar

            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(activities) { activity in
                        ActivityCard(activity: activity)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 24)
            }

            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }

    var topBar: some View {
        VStack(spacing: 0) {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.black)
                }

                Text("RECENT ACTIVITY")
                    .font(.system(size: 17, weight: .bold))

                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.top, 12)
            .padding(.bottom, 16)

            Divider()
        }
    }
}

#Preview {
    NavigationStack {
        RecentActivityView(activities: [
            ActivityItem(name: "Vanessa_Lee", text: "requested to rent your Ganni Seersucker Midi Dress.", imageName: "person1"),
            ActivityItem(name: "ivy.diary", text: "requested to rent your Ganni Seersucker Midi Dress.", imageName: "person2"),
            ActivityItem(name: "lilac.ellaes", text: "requested to rent your Ganni Seersucker Midi Dress.", imageName: "person3")
        ])
    }
}
