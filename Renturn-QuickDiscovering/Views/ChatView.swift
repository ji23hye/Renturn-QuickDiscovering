//
//  ChatView.swift
//  Renturn-QuickDiscovering
//
//  Created by Jihye Park on 11/5/2026.
//

import SwiftUI

struct ChatView: View {
    let message: MessagePreview
    @Environment(\.dismiss) var dismiss
    @State private var inputText = ""

    var body: some View {
        VStack(spacing: 0) {
            topBar

            ScrollView {
                VStack(spacing: 18) {
                    chatBubble(message.text, isMe: true)
                    chatBubble("Hi! Yes, I think it would fit you well. I’m 165cm and it sits just above my knees.", isMe: false)
                    chatBubble("That sounds perfect, thank you!", isMe: true)
                }
                .padding(.horizontal, 18)
                .padding(.top, 28)
            }

            messageInput
            bottomTab
        }
        .navigationBarBackButtonHidden(true)
    }

    var topBar: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.black)
                }

                Circle()
                    .fill(Color.blue.opacity(0.2))
                    .frame(width: 36, height: 36)
                    .overlay(
                        Image(systemName: "person.fill")
                            .foregroundColor(.blue)
                    )

                Text(message.name)
                    .font(.system(size: 17, weight: .bold))

                Spacer()
            }
            .padding(.horizontal, 18)
            .padding(.top, 12)
            .padding(.bottom, 14)

            Divider()
        }
    }

    func chatBubble(_ text: String, isMe: Bool) -> some View {
        HStack {
            if isMe { Spacer() }

            Text(text)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(isMe ? .white : .black)
                .padding(14)
                .background(isMe ? Color.blue : Color(.systemGray5))
                .cornerRadius(14)
                .frame(maxWidth: 240, alignment: isMe ? .trailing : .leading)

            if !isMe { Spacer() }
        }
    }

    var messageInput: some View {
        HStack(spacing: 12) {
            TextField("Type a message...", text: $inputText)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)

            Button {
                inputText = ""
            } label: {
                Image(systemName: "arrow.up")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 48, height: 48)
                    .background(Color.blue)
                    .clipShape(Circle())
            }
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 12)
        .background(Color.white)
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
        ChatView(message: MessagePreview(
            name: "vogue_vintage",
            text: "Hi! I’m 160cm. Do you think this dress would fit me well?",
            imageName: "person1"
        ))
    }
}
