//
//  HomeViewController+FAB.swift
//  DynamicCarouselListApp
//
//  Created by Ranjit Kumar on 13/04/25.
//

import UIKit

extension HomeViewController {
     func setupFAB() {
        let fab = UIButton(type: .system)
        fab.setImage(UIImage(systemName: "plus"), for: .normal)
        fab.tintColor = .white
        fab.backgroundColor = .systemBlue
        fab.layer.cornerRadius = 28
        fab.layer.shadowOpacity = 0.3
        fab.layer.shadowRadius = 3
        fab.addTarget(self, action: #selector(openStats), for: .touchUpInside)
        view.addSubview(fab)
        fab.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fab.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            fab.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            fab.widthAnchor.constraint(equalToConstant: 56),
            fab.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    @objc private func openStats() {
        let stats = viewModel.topCharactersCount()
            let msg = stats.map { "\($0.0): \($0.1)" }.joined(separator: "\n")
            coordinator.showStatsAlert(from: self, message: msg)
    }
}
