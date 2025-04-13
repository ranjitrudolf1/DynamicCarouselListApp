//
//  HomeView.swift
//  DynamicCarouselListApp
//
//  Created by Ranjit Kumar on 09/04/25.
//

import Foundation
import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var showSheet = false
    @State private var searchBarPinned = false
    @State private var isEditingSearch = false
    
    var body: some View {
        ScrollViewReader { proxy in
            NavigationView {
                ZStack(alignment: .bottomTrailing) {
                    Color(#colorLiteral(red: 0.9562687278, green: 0.9828713536, blue: 0.972435534, alpha: 1)).ignoresSafeArea()
                    GeometryReader { geometry in
                        TrackableView {
                            ScrollView {
                                LazyVStack(pinnedViews: [.sectionHeaders]) {
                                    // Carousel
                                    CarouselView(items: viewModel.carouselItems, selectedIndex: $viewModel.selectedIndex)
                                    
                                    // Sticky Header
                                    Section(header:
                                                SearchHeaderView(text: $viewModel.searchText, searchBarPinned: $searchBarPinned,isEditing: $isEditingSearch)
                                        .id("SearchBar")
                                    ) {
                                        if viewModel.filteredItems.isEmpty {
                                                Text("No Data available")
                                                    .font(.headline)
                                                    .foregroundColor(.gray)
                                                    .padding()
                                                    .frame(maxWidth: .infinity, alignment: .center)
                                            } else {
                                                ForEach(viewModel.filteredItems, id: \.title) { item in
                                                    ItemCellView(item: item)
                                                }
                                            }
                                    }
                                }
                                
                            }
                            .padding(.top, 1)
                            
                        } onOffsetChange: { y in
                            if y < 0 {
                                searchBarPinned = true
                            } else {
                                searchBarPinned = false
                            }
                        }
                        
                    }
                    .onChange(of: viewModel.searchText) { newText in
                        print("Search Text Changed: \(newText)")
                        if isEditingSearch {
                            withAnimation {
                                proxy.scrollTo("SearchBar", anchor: .top)
                            }
                        } else {
                            searchBarPinned = false
                        }
                    }
                    // FAB
                    Button(action: { showSheet.toggle() }) {
                        Image(systemName: "plus")
                            .font(.title)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .shadow(radius: 4)
                    }
                    .padding()
                }
            }
            .onChange(of: searchBarPinned) { pinned in
                if pinned {
                    withAnimation {
                        proxy.scrollTo("SearchBar", anchor: .top)
                    }
                }
            }
            .onChange(of: viewModel.searchText) { newText in
                print("Search Text Changed: \(newText)")
                if isEditingSearch {
                    withAnimation {
                        proxy.scrollTo("SearchBar", anchor: .top)
                    }
                } else {
                    searchBarPinned = false
                }
            }
            .sheet(isPresented: $showSheet) {
                StatsSheetView(viewModel: viewModel)
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
