//
//  DefaultCarouselDataService.swift
//  DynamicCarouselListApp
//
//  Created by Ranjit Kumar on 13/04/25.
//

import Foundation

class DefaultCarouselDataService: CarouselDataService {
    func loadItems() -> [ItemModel] {
        
        guard let url = Bundle.main.url(forResource: JSONConstants.carouselDataFileName, withExtension: JSONConstants.jsonExtension),
              let data = try? Data(contentsOf: url) else {
            return []
        }

        do {
            let decoder = JSONDecoder()
            let categories = try decoder.decode([ItemModel].self, from: data)
            return categories
        } catch {
            print("Error decoding JSON: \(error)")
            return []
        }
    }
}
