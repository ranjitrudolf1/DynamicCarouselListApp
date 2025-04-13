//
//  ItemModel.swift
//  DynamicCarouselListApp
//
//  Created by Ranjit Kumar on 09/04/25.
//

import Foundation

struct ItemModel: Identifiable, Codable {
    let id: UUID?
    let categoryTitle: String?
    let categoryImage: String?
    let itemModelData: [ItemModelData]?

    // Custom initializer to decode UUID as well
    enum CodingKeys: String, CodingKey {
        case id
        case categoryTitle
        case categoryImage
        case itemModelData
    }

    init(id: UUID = UUID(), categoryTitle: String, categoryImage: String, itemModelData: [ItemModelData]) {
        self.id = id
        self.categoryTitle = categoryTitle
        self.categoryImage = categoryImage
        self.itemModelData = itemModelData
    }

    // Implementing the decoding initializer
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(UUID.self, forKey: .id)
        self.categoryTitle = try container.decodeIfPresent(String.self, forKey: .categoryTitle)
        self.categoryImage = try container.decodeIfPresent(String.self, forKey: .categoryImage)
        self.itemModelData = try container.decodeIfPresent([ItemModelData].self, forKey: .itemModelData)
    }
}

struct ItemModelData: Identifiable, Codable {
    let id: UUID?
    let title: String?
    let imageName: String?

    init(id: UUID = UUID(), title: String, imageName: String) {
        self.id = id
        self.title = title
        self.imageName = imageName
    }

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageName
    }

    // Implementing the decoding initializer
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(UUID.self, forKey: .id)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.imageName = try container.decodeIfPresent(String.self, forKey: .imageName)
    }
}
