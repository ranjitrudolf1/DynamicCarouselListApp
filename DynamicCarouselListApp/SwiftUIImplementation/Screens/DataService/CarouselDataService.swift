//
//  CarouselDataService.swift
//  DynamicCarouselListApp
//
//  Created by Ranjit Kumar on 13/04/25.
//

import Foundation

protocol CarouselDataService {
    func loadItems() -> [ItemModel]
}
