//
//  UIImageView+Extension.swift
//  DynamicCarouselListApp
//
//  Created by Ranjit Kumar on 13/04/25.
//

import UIKit

extension UIImageView {
    func loadImage(from urlString: String, placeholder: UIImage? = nil) {
        self.image = placeholder
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard
                let data = data,
                error == nil,
                let image = UIImage(data: data)
            else { return }

            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}
