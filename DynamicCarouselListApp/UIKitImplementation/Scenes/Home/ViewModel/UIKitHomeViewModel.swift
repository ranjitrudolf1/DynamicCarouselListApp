//
//  HomeViewModel.swift
//  DynamicCarouselListApp
//
//  Created by Ranjit Kumar on 09/04/25.
//

import Foundation

class UIKitHomeViewModel: HomeViewModelProtocol {
    private(set) var carouselItems: [ItemModel] = []
    var selectedIndex: Int = 0
    var searchText: String = ""

    init() {
        loadCarouselData()
    }
    
    func loadCarouselData() {
        guard let url = Bundle.main.url(forResource: JSONConstants.carouselDataFileName, withExtension: JSONConstants.jsonExtension),
                  let data = try? Data(contentsOf: url) else {
                return
            }

            do {
                // Decode the JSON into an array of CategoryModel objects
                let decoder = JSONDecoder()
                let categories = try decoder.decode([ItemModel].self, from: data)
                
                // Convert the decoded data into ItemModel format
                carouselItems = categories
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }

    func filteredItems() -> [ItemModelData] {
        guard selectedIndex < carouselItems.count else { return [] }
        let activeList = carouselItems[selectedIndex].itemModelData
        if searchText.isEmpty {
            return activeList ?? []
        } else {
            return (activeList ?? []).filter { ($0.title ?? "").localizedCaseInsensitiveContains(searchText) }
        }
    }

    func topCharactersCount() -> [(Character, Int)] {
        let characters = filteredItems().flatMap { $0.title?.lowercased() ?? "" }.filter { $0.isLetter }
        let freq = Dictionary(grouping: characters, by: { $0 }).mapValues { $0.count }
        return freq.sorted { $0.value > $1.value }.prefix(3).map { ($0.key, $0.value) }
    }
}
