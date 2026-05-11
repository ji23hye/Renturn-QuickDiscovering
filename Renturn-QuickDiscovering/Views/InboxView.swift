//
//  InboxView.swift
//  Renturn-QuickDiscovering
//
//  Created by Jihye Park on 11/5/2026.
//

import SwiftUI

struct InboxView: View {
    @Environment(\.dismiss) var dismiss

    let activities = [
        ActivityItem(name: "vogue_vintage", text: "replied to your fit question about the Ganni Black Stretch Cotton Dress.", imageName: "person1"),
        ActivityItem(name: "ivy.diary", text: "confirmed pickup details for the Prada Shoulder Bag.", imageName: "person2"),
        ActivityItem(name: "lilac.ellaes", text: "sent extra measurements for the Linen Blazer.", imageName: "person3")
    ]

    let messages = [
        MessagePreview(name: "vogue_vintage", text: "Hi! Yes, I think it would fit you well. I’m 165cm and it sits just above my knees.", imageName: "person1"),
        MessagePreview(name: "ivy.diary", text: "I can do pickup after 5pm if that works for you.", imageName: "person2"),
        MessagePreview(name: "lilac.ellaes", text: "The blazer shoulder width is around 40cm.", imageName: "person3")
    ]

    var body: some View {
        VStack(spacing: 0) {
            header

            ScrollView {
                VStack(alignment: .leading, spacing: 22) {
                    Text("Inbox")
                        .font(.system(size: 28, weight: .bold))

                    VStack(alignment: .leading, spacing: 12) {
                        Text("RECENT ACTIVITY")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.blue)

                        ForEach(activities) { activity in
                            ActivityCard(activity: activity)
                        }

                        HStack {
                            Spacer()

                            NavigationLink("View more") {
                                RecentActivityView(activities: activities)
                            }
                            .font(.system(size: 13, weight: .medium))
                            .foregroundColor(.blue)
                        }
                    }

                    VStack(alignment: .leading, spacing: 12) {
                        Text("MESSAGES")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.blue)

                        ForEach(messages) { message in
                            NavigationLink {
                                ChatView(message: message)
                            } label: {
                                MessageCard(message: message)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 22)
                .padding(.bottom, 24)
            }

            bottomTab
        }
        .navigationBarBackButtonHidden(true)
    }

    var header: some View {
        VStack(spacing: 0) {
            Text("Renturn")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.blue)
                .padding(.top, 12)
                .padding(.bottom, 12)

            Divider()
        }
    }

    var bottomTab: some View {
        HStack {
            Spacer()

            Button {
                dismiss()
            } label: {
                tabItem(icon: "safari", title: "Explore", selected: false)
            }

            Spacer()

            tabItem(icon: "envelope", title: "Inbox", selected: true)

            Spacer()

            NavigationLink {
                ProfileView()
            } label: {
                tabItem(icon: "person", title: "Profile", selected: false)
            }
            Spacer()
        }
        .padding(.top, 10)
        .padding(.bottom, 18)
        .background(Color.white)
        .overlay(Divider(), alignment: .top)
    }

    func tabItem(icon: String, title: String, selected: Bool) -> some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 22))

            Text(title)
                .font(.system(size: 12, weight: .bold))
        }
        .foregroundColor(selected ? .blue : .primary)
    }
}

#Preview {
    NavigationStack {
        InboxView()
    }
}
