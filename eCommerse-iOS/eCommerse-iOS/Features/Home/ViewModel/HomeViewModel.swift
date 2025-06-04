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
  var columns: [GridItem] = Array(repeating: .init(.adaptive(minimum: 150, maximum: 170)), count: 2)
  
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
      let imageCategory = setImageCategory(categoryName)
      return CategoryProducts(name: categoryName, image: imageCategory, products: products.filter { $0.category == categoryName })
    }
    
    mainCategory.categoryProducts = categoryProducts
    self.mainCategory = mainCategory
  }
  
  private func setImageCategory(_ categoryName: String) -> String {
    let lower = categoryName.lowercased()
    let mapping = mappedCategories()
    
    for (keyword, imageName) in mapping {
      if lower.contains(keyword) {
        return imageName
      }
    }
    return "default-category"
  }
  
  private func mappedCategories() -> [(keyword: String, imageName: String)] {
    return [("women", "w-blouse"),
            ("men", "m-shirt"),
            ("electronics", "electronics"),
            ("jewelery", "jewelery")]
  }
}
