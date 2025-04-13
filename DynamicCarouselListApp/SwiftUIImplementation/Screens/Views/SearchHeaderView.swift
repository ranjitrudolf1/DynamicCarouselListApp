//
//  Untitled.swift
//  DynamicCarouselListApp
//
//  Created by Ranjit Kumar on 14/04/25.
//

import SwiftUI

struct SearchHeaderView: View {
    @Binding var text: String
    @Binding var searchBarPinned: Bool
    @Binding var isEditing: Bool

    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9562687278, green: 0.9828713536, blue: 0.972435534, alpha: 1))
            TextField("Search...", text: $text, onEditingChanged: { editing in
                withAnimation {
                    isEditing = editing
                    searchBarPinned = editing
                }
            })
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
        }
    }
}
