//
//  ProfileView.swift
//  Renturn-QuickDiscovering
//
//  Created by Jihye Park on 11/5/2026.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) var dismiss

    let agenda = [
        ("May 21", "Pick up Ganni Black Dress", "vogue_vintage"),
        ("May 23", "Return Ganni Black Dress", "Before 6pm")
    ]

    var body: some View {
        VStack(spacing: 0) {
            header

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    profileHeader

                    plannerSection
                }
                .padding(.horizontal, 24)
                .padding(.top, 24)
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

    var profileHeader: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(alignment: .top) {
                Circle()
                    .fill(Color.blue.opacity(0.15))
                    .frame(width: 78, height: 78)
                    .overlay(
                        Image(systemName: "person.fill")
                            .font(.system(size: 34))
                            .foregroundColor(.blue)
                    )

                Spacer()

                Button {
                    // edit profile action
                } label: {
                    Image(systemName: "gearshape")
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                        .frame(width: 44, height: 44)
                        .background(Color(.systemGray6))
                        .clipShape(Circle())
                }
            }

            Text("jihye_rents")
                .font(.system(size: 24, weight: .bold))

            Text("Quick rental planner for upcoming outfits and returns.")
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.gray)

            HStack(spacing: 12) {
                statCard(number: "1", label: "UPCOMING")
                statCard(number: "0", label: "ACTIVE NOW")
                statCard(number: "2", label: "SAVED")
            }
        }
    }

    func statCard(number: String, label: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(number)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.blue)

            Text(label)
                .font(.system(size: 11, weight: .bold))
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.06), radius: 6, y: 3)
    }

    var plannerSection: some View {
        VStack(alignment: .leading, spacing: 18) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Rental Planner")
                    .font(.system(size: 26, weight: .bold))

                Text("MANAGE YOUR UPCOMING RENTALS")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.gray)
                    .tracking(2)
            }

            calendarCard

            Text("UPCOMING AGENDA")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.gray)
                .tracking(2)

            ForEach(agenda, id: \.0) { item in
                agendaCard(date: item.0, title: item.1, subtitle: item.2)
            }
        }
    }

    var calendarCard: some View {
        VStack(alignment: .leading, spacing: 18) {
            HStack {
                Image(systemName: "calendar")
                    .foregroundColor(.blue)
                    .frame(width: 34, height: 34)
                    .background(Color.blue.opacity(0.1))
                    .clipShape(Circle())

                Text("May 2026")
                    .font(.system(size: 20, weight: .bold))

                Spacer()
            }

            let weekdays = ["S", "M", "T", "W", "T", "F", "S"]
            let calendarDays: [Int?] = [nil, nil, nil, nil, nil] + Array(1...31).map { Optional($0) }
            let columns = Array(repeating: GridItem(.flexible(), spacing: 8), count: 7)

            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(weekdays.indices, id: \.self) { index in
                    Text(weekdays[index])
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.gray.opacity(0.6))
                        .frame(width: 34, height: 20)
                }

                ForEach(calendarDays.indices, id: \.self) { index in
                    if let day = calendarDays[index] {
                        VStack(spacing: 3) {
                            Text("\(day)")
                                .font(.system(size: 13, weight: .bold))
                                .foregroundColor(day == 21 ? .white : .gray)
                                .frame(width: 34, height: 34)
                                .background(day == 21 ? Color.blue : Color.clear)
                                .clipShape(Circle())

                            if [21, 23].contains(day) {
                                Circle()
                                    .fill(day == 21 ? Color.green : Color.orange)
                                    .frame(width: 5, height: 5)
                            } else {
                                Circle()
                                    .fill(Color.clear)
                                    .frame(width: 5, height: 5)
                            }
                        }
                        .frame(width: 34, height: 42)
                    } else {
                        Color.clear
                            .frame(width: 34, height: 42)
                    }
                }
            }
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(24)
        .shadow(color: .black.opacity(0.08), radius: 10, y: 4)
    }

    func agendaCard(date: String, title: String, subtitle: String) -> some View {
        HStack(spacing: 14) {
            Text(date)
                .font(.system(size: 13, weight: .bold))
                .foregroundColor(.blue)
                .frame(width: 58)

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 15, weight: .bold))

                Text(subtitle)
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(16)
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

            NavigationLink {
                InboxView()
            } label: {
                tabItem(icon: "envelope", title: "Inbox", selected: false)
            }

            Spacer()

            tabItem(icon: "person", title: "Profile", selected: true)

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
        ProfileView()
    }
}
