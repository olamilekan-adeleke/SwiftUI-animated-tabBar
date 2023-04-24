//
//  ContentView.swift
//  SwiftUI animated tabBar
//
//  Created by Enigma Kod on 25/04/2023.
//

import SwiftUI

let tags: [String] = ["History", "Classical", "Biography", "Cartoon", "Anime", "Fantsy", "Hentai", "Slice Of Life"]

struct ContentView: View {
    @State private var selectedTag: String = "History"
    @Namespace private var animation

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading) {
                Text("Browse").font(.largeTitle.bold())

                Text("Explore our collection")
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)

            tagsView()

            Spacer()
        }
        .padding(.vertical)
    }

    @ViewBuilder func tagsView() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(tags, id: \.self) { tag in
                    Text(tag)
                        .font(.caption)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .foregroundColor(tag == selectedTag ? .white : .gray)
                        .background {
                            if tag == selectedTag {
                                Capsule().fill(.blue)
                                    .matchedGeometryEffect(id: "ID", in: animation)
                            } else {
                                Capsule().fill(.gray.opacity(0.2))
                            }
                        }
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.7)) {
                                selectedTag = tag
                            }
                        }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
