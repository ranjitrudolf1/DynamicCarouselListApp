//
//  UISearchBar+Styling.swift
//  DynamicCarouselListApp
//
//  Created by Ranjit Kumar on 13/04/25.
//

import UIKit

extension UISearchBar {
    func applyDefaultStyle(placeholder: String = "Search...") {
        self.placeholder = placeholder
        self.searchTextField.textColor = .black
        self.searchTextField.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [.foregroundColor: UIColor.lightGray]
        )
    }
}
