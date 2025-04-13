//
//  TrackableView.swift
//  DynamicCarouselListApp
//
//  Created by Ranjit Kumar on 14/04/25.
//

import SwiftUI

struct TrackableView<Content: View>: View {
    let content: () -> Content
    var onOffsetChange: (CGFloat) -> Void

    var body: some View {
        GeometryReader { proxy in
            content()
                .background(
                    GeometryReader { innerProxy in
                        Color.clear
                            .preference(key: ViewOffsetKey.self, value: innerProxy.frame(in: .global).minY)
                    }
                )
                .onPreferenceChange(ViewOffsetKey.self, perform: onOffsetChange)
        }
    }
}
