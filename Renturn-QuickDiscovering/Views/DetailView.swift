//
//  DetailView.swift
//  Renturn-QuickDiscovering
//
//  Created by Jihye Park on 10/5/2026.
//

import SwiftUI

struct DetailView: View {
    let product: Product

    @Environment(\.dismiss) var dismiss
    @State private var duration = 4

    var totalPrice: Int {
        product.pricePerDay * duration
    }

    var body: some View {
        VStack(spacing: 0) {
            topBar

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    ZStack(alignment: .topTrailing) {
                        Image(product.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .background(Color(.systemGray6))

                        Button {
                            // saved item action
                        } label: {
                            Image(systemName: "heart")
                                .font(.system(size: 24))
                                .foregroundColor(.black)
                                .padding(10)
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(radius: 2)
                        }
                        .padding()
                    }

                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(product.brand)
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.blue)

                            Text(product.name)
                                .font(.system(size: 24, weight: .bold))
                                .lineLimit(2)
                        }

                        Spacer()

                        VStack(alignment: .trailing, spacing: 2) {
                            Text("$\(product.pricePerDay)")
                                .font(.system(size: 36, weight: .bold))
                                .foregroundColor(.blue)

                            Text("PER DAY")
                                .font(.system(size: 12, weight: .bold))
                        }
                    }

                    Text("Size: \(product.size)")
                        .font(.system(size: 16, weight: .bold))

                    HStack {
                        Text("Duration (Days)")
                            .font(.system(size: 16, weight: .bold))

                        Spacer()

                        HStack(spacing: 16) {
                            Button {
                                if duration > 1 {
                                    duration -= 1
                                }
                            } label: {
                                Image(systemName: "minus")
                            }

                            Text("\(duration)")
                                .font(.system(size: 16, weight: .bold))

                            Button {
                                duration += 1
                            } label: {
                                Image(systemName: "plus")
                            }
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 8)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                    }

                    Button {
                        // final rent action
                    } label: {
                        HStack {
                            Image(systemName: "calendar")
                            Text("Rent for $\(totalPrice)")
                                .font(.system(size: 20, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 58)
                        .background(Color.blue)
                        .cornerRadius(14)
                    }
                    .padding(.top, 20)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 30)
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    var topBar: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 22, weight: .semibold))
                    .foregroundColor(.black)
            }

            Spacer()
        }
        .padding(.horizontal, 24)
        .padding(.top, 12)
        .padding(.bottom, 12)
        .background(Color.white)
    }
}

#Preview {
    DetailView(product: sampleDressProducts[0])
}
