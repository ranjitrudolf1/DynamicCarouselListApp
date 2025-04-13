//
//  ViewController.swift
//  DynamicCarouselListApp
//
//  Created by Ranjit Kumar on 09/04/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var noDataLabel: UILabel!
    @IBOutlet weak var searchBarTopConstraint: NSLayoutConstraint!
     let coordinator: HomeCoordinating
     var viewModel: HomeViewModelProtocol
    var searchBarOriginalY: CGFloat = 0
    
    init(viewModel: HomeViewModelProtocol = UIKitHomeViewModel(),
         coordinator: HomeCoordinating = HomeCoordinator()) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = UIKitHomeViewModel()
        self.coordinator = HomeCoordinator()
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupSrollView()
        setupSearch()
        setupCarousel()
        setupTableView()
        setupFAB()
        setupPageControl()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if searchBarOriginalY == 0 {
                searchBarOriginalY = searchView.frame.origin.y
            }
        updateTableView()
    }
    
    func setupNavigationBar(){
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setupSrollView(){
        scrollView.delegate = self
    }
    
    private func setupSearch() {
        searchBar.applyDefaultStyle()
        searchBar.delegate = self
    }
    
    private func setupCarousel() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.register(UINib(nibName: "CarouselCell", bundle: nil), forCellWithReuseIdentifier: "CarouselCell")
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = viewModel.carouselItems.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .blue
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = .clear
        tableView.register(UINib(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "ListTableViewCell")
    }
    
    func updateTableView(){
        if viewModel.filteredItems().count > 0 {
            self.noDataLabel.isHidden = true
        } else {
            self.noDataLabel.isHidden = false
        }
        let previousOffset = scrollView.contentOffset

            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.tableView.layoutIfNeeded()
                self.tableHeight.constant = self.tableView.contentSize.height

                self.scrollView.layoutIfNeeded()

                self.scrollView.setContentOffset(previousOffset, animated: false)
            }
    }
}
