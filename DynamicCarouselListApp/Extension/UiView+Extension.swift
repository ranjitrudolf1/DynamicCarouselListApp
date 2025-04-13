//
//  UiView+Extension.swift
//  DynamicCarouselListApp
//
//  Created by Ranjit Kumar on 09/04/25.
//

import UIKit

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
 
        return instantiateFromNib()
    }
}
