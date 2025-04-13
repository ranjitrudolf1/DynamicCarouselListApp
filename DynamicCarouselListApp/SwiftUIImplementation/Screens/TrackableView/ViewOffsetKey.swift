//
//  ViewOffsetKey.swift
//  DynamicCarouselListApp
//
//  Created by Ranjit Kumar on 14/04/25.
//

import SwiftUI

struct ViewOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
