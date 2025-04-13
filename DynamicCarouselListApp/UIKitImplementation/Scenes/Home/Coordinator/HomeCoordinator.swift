//
//  HomeCoordinator.swift
//  DynamicCarouselListApp
//
//  Created by Ranjit Kumar on 13/04/25.
//

import Foundation
import UIKit

protocol HomeCoordinating {
    func showStatsAlert(from viewController: UIViewController, message: String)
}

class HomeCoordinator: HomeCoordinating {
    func showStatsAlert(from viewController: UIViewController, message: String) {
        let alert = UIAlertController(title: "Stats", message: message, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Close", style: .cancel))
        viewController.present(alert, animated: true)
    }
}
