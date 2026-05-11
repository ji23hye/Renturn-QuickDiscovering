//
//  CategoryView.swift
//  Renturn-QuickDiscovering
//
//  Created by Jihye Park on 10/5/2026.
//

import SwiftUI

struct CategoryView: View {
    let categories = [
        ("Dresses", "tshirt"),
        ("Tops", "tshirt"),
        ("Bottoms", "figure.walk"),
        ("Bags", "bag"),
        ("Accessories", "eyeglasses"),
        ("Outerwear", "jacket")
    ]

    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                header

                ScrollView {
                    VStack(alignment: .leading, spacing: 28) {
                        searchBar

                        Text("What are you looking for?")
                            .font(.system(size: 24, weight: .bold))

                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(categories, id: \.0) { category in
                                NavigationLink {
                                    ExploreView(categoryName: category.0)
                                } label: {
                                    CategoryCard(title: category.0, icon: category.1)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                    .padding(.horizontal, 24)
                    .padding(.top, 24)
                    .padding(.bottom, 24)
                }

                bottomTab
            }
            .navigationBarBackButtonHidden(true)
        }
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

    var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 22))
                .foregroundColor(.gray)

            Text("Search brands, styles, closets...")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.gray)

            Spacer()
        }
        .padding(.horizontal, 16)
        .frame(height: 56)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.gray.opacity(0.7), lineWidth: 1)
        )
    }

    var bottomTab: some View {
        HStack {
            Spacer()

            tabItem(icon: "safari", title: "Explore", selected: true)

            Spacer()

            NavigationLink {
                InboxView()
            } label: {
                tabItem(icon: "envelope", title: "Inbox", selected: false)
            }

            Spacer()

            tabItem(icon: "person", title: "Profile", selected: false)

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
    CategoryView()
}
