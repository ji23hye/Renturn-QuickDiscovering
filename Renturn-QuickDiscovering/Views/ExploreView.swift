//
//  ExploreView.swift
//  Renturn-QuickDiscovering
//
//  Created by Jihye Park on 10/5/2026.
//

import SwiftUI

struct ExploreView: View {
    let categoryName: String
    @Environment(\.dismiss) var dismiss

    @State private var selectedFilter = "All"
    @State private var selectedCategory: String

    let categories = ["Dresses", "Tops", "Bottoms", "Bags", "Accessories", "Outerwear"]
    let filters = ["All", "Today", "Near me", "Under $20", "Formal"]

    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    init(categoryName: String) {
        self.categoryName = categoryName
        _selectedCategory = State(initialValue: categoryName)
    }

    var filteredProducts: [Product] {
        if selectedFilter == "Today" {
            return [sampleDressProducts[0], sampleDressProducts[2], sampleDressProducts[3]]
        } else if selectedFilter == "Under $20" {
            return sampleDressProducts.filter { $0.pricePerDay < 20 }
        } else {
            return sampleDressProducts
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            header

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    searchBar
                    categoryDropdown
                    filterChips

                    Text(selectedFilter == "Today" ? "Available today" : selectedFilter)
                        .font(.system(size: 20, weight: .bold))

                    LazyVGrid(columns: columns, spacing: 24) {
                        ForEach(filteredProducts) { product in
                            NavigationLink {
                                DetailView(product: product)
                            } label: {
                                ProductCard(product: product)
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

    var header: some View {
        VStack(spacing: 0) {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(.black)
                }

                Spacer()

                Text("Renturn")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.blue)

                Spacer()

                Color.clear
                    .frame(width: 22, height: 22)
            }
            .padding(.horizontal, 24)
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

    var categoryDropdown: some View {
        Menu {
            ForEach(categories, id: \.self) { category in
                Button {
                    selectedCategory = category
                    selectedFilter = "All"
                } label: {
                    Text(category)
                }
            }
        } label: {
            HStack {
                Text(selectedCategory)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.black)

                Spacer()

                Image(systemName: "chevron.down")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.black)
            }
        }
    }

    var filterChips: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(filters, id: \.self) { filter in
                    Button {
                        selectedFilter = filter
                    } label: {
                        Text(filter)
                            .font(.system(size: 15, weight: .medium))
                            .padding(.horizontal, 18)
                            .padding(.vertical, 10)
                            .background(selectedFilter == filter ? Color.blue : Color(.systemGray6))
                            .foregroundColor(selectedFilter == filter ? .white : .primary)
                            .cornerRadius(22)
                    }
                }
            }
        }
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
    NavigationStack {
        ExploreView(categoryName: "Dresses")
    }
}
