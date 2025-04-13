//
//  ItemCellView.swift
//  DynamicCarouselListApp
//
//  Created by Ranjit Kumar on 14/04/25.
//

import SwiftUI

struct ItemCellView: View {
    let item: ItemModelData

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: Constant.itemImageUrl + (item.imageName ?? ""))) { phase in
                switch phase {
                case .success(let image):
                    image.resizable().scaledToFill().frame(width: 50, height: 50).cornerRadius(6)
                case .failure:
                    Image(systemName: "exclamationmark.triangle.fill")
                        .resizable().frame(width: 50, height: 50).foregroundColor(.red)
                default:
                    ProgressView().frame(width: 50, height: 50)
                }
            }
            .padding(.leading, 5)

            VStack(alignment: .leading) {
                Text(item.title ?? "")
                    .font(.subheadline)
                Text("Subtitle text")
                    .font(.caption)
                    .foregroundColor(.black.opacity(0.5))
            }

            Spacer()
        }
        .padding(8)
        .frame(maxWidth: .infinity)
        .background(Color(#colorLiteral(red: 0.804, green: 0.910, blue: 0.882, alpha: 1)))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
