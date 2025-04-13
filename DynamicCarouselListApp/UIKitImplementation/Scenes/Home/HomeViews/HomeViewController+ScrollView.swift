//
//  HomeViewController+ScrollView.swift
//  DynamicCarouselListApp
//
//  Created by Ranjit Kumar on 14/04/25.
//

import UIKit

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        if yOffset > searchBarOriginalY {
            let stickyY = yOffset - searchBarOriginalY
            searchView.transform = CGAffineTransform(translationX: 0, y: stickyY)
        } else {
            searchView.transform = .identity
        }
    }
}
