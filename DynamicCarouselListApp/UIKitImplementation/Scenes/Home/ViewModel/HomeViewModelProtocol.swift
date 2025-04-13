//
//  HomeViewModelProtocol.swift
//  DynamicCarouselListApp
//
//  Created by Ranjit Kumar on 13/04/25.
//

import Foundation

protocol HomeViewModelProtocol {
    var carouselItems: [ItemModel] { get }
    var selectedIndex: Int { get set }
    var searchText: String { get set }

    func filteredItems() -> [ItemModelData]
    func topCharactersCount() -> [(Character, Int)]
}
