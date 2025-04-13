//
//  StatsSheetView.swift
//  DynamicCarouselListApp
//
//  Created by Ranjit Kumar on 09/04/25.
//

import SwiftUI

struct StatsSheetView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        VStack(spacing: 16) {
            Text("List \(viewModel.selectedIndex + 1) (\(viewModel.filteredItems.count) items)")
                .font(.headline)

            ForEach(viewModel.topCharactersCount(), id: \.0) { char, count in
                Text("\(char) = \(count)")
            }
        }
        .padding()
    }
}
