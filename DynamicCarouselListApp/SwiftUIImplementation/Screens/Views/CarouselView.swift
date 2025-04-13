//
//  CarouselView.swift
//  DynamicCarouselListApp
//
//  Created by Ranjit Kumar on 14/04/25.
//

import SwiftUI

struct CarouselView: View {
    var items: [ItemModel]
    @Binding var selectedIndex: Int

    var body: some View {
        VStack {
            TabView(selection: $selectedIndex) {
                ForEach(items.indices, id: \.self) { index in
                    AsyncImage(url: URL(string: Constant.categoryImageUrl + (items[index].categoryImage ?? ""))) { phase in
                        switch phase {
                        case .success(let image):
                            image.resizable().scaledToFill().cornerRadius(15)
                        case .failure:
                            Image(systemName: "exclamationmark.triangle.fill")
                                .resizable().foregroundColor(.red)
                        default:
                            ProgressView()
                        }
                    }
                    .padding(15)
                    .padding(.top, 0)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 200)

            // Dots
            HStack(spacing: 8) {
                ForEach(items.indices, id: \.self) { index in
                    Circle()
                        .fill(index == selectedIndex ? Color.blue : Color.gray.opacity(0.4))
                        .frame(width: 8, height: 8)
                }
            }
            .padding(.bottom, 10)
        }
    }
}
