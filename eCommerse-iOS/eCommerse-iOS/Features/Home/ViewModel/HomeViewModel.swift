//
//  HomeViewModel.swift
//  eCommerse-iOS
//
//  Created by Yan Cervantes on 04/06/25.
//

import SwiftUI

@Observable
final class HomeViewModel {
  
  let client: HomeClient
  
  var isDataLoaded: Bool = false
  var showAlert: Bool = false
  var errorMessage: String = ""
  
  var mainCategory: MainCategory = MainCategory(name: "Categories", categoryProducts: [])
  
  @MainActor
  init(client: HomeClient = HomeClient()) {
    self.client = client
  }
  
  //MARK: Methods
  
  @MainActor
  func didFetchProducts() async {
    guard !isDataLoaded  else { return }
    do {
      let data = try await client.getProducts()
      configureCategory(data)
    } catch {
      errorMessage = error.localizedDescription
      showAlert = true
    }
    isDataLoaded = true
  }
  
  private func configureCategory(_ products: [Product]) {
    var mainCategory: MainCategory = MainCategory(name: "Categories", categoryProducts: [])
    
    let categoryNames = Set(products.map { $0.category })
    let categoryProducts = categoryNames.map { categoryName in
      CategoryProducts(name: categoryName, products: products.filter { $0.category == categoryName })
    }
    mainCategory.categoryProducts = categoryProducts
    self.mainCategory = mainCategory
  }
}
