//
//  HomeViewController+SearchDelegate.swift
//  DynamicCarouselListApp
//
//  Created by Ranjit Kumar on 13/04/25.
//

import UIKit

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchText = searchText
        tableView.reloadData()
        updateTableView()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        scrollView.setContentOffset(CGPoint(x: 0, y: searchBarOriginalY), animated: true)
    }
}
