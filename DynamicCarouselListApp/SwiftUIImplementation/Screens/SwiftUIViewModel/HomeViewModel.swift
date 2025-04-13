//
//  HomeViewModel.swift
//  DynamicCarouselListApp
//
//  Created by Ranjit Kumar on 09/04/25.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var carouselItems: [ItemModel] = []
    @Published var selectedIndex: Int = 0
    @Published var searchText: String = ""
    
    private let dataService: CarouselDataService
    
    // Injected data service via Dependency Injection
    init(dataService: CarouselDataService = DefaultCarouselDataService()) {
        self.dataService = dataService
        loadCarouselData()
    }
    
    func loadCarouselData() {
        carouselItems = dataService.loadItems()
    }
    
    var filteredItems: [ItemModelData] {
        guard selectedIndex < carouselItems.count else { return [] }
        let activeList = carouselItems[selectedIndex].itemModelData
        if searchText.isEmpty {
            return activeList ?? []
        } else {
            return activeList?.filter { ($0.title ?? "").localizedCaseInsensitiveContains(searchText) } ?? []
        }
    }
    
    
    
    func topCharactersCount() -> [(Character, Int)] {
        let characters = filteredItems.flatMap { ($0.title ?? "").lowercased() }.filter { $0.isLetter }
        let freq = Dictionary(grouping: characters, by: { $0 }).mapValues { $0.count }
        return freq.sorted { $0.value > $1.value }.prefix(3).map { ($0.key, $0.value) }
    }
}
